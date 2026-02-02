#!/bin/bash

#################################
# Author:       Matej Ciglenečki
# Description:  Backup files to external hard disk
#               1. Mount veracrypt container
#               2. Rsync files defined in exclude and include lists
#               3. Unmount veracrypt container
#################################

set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  sudo ./backup_veracrypt.sh [options] <container.hc> <mount_point>

Options:
  -s, --source DIR        Source root (default: invoking users home)
      --include FILE      Rsync include list (default: ~/.assets/backup_include_pattern.txt)
      --exclude FILE      Rsync exclude list (default: ~/.assets/backup_exclude_pattern.txt)
  -l, --log FILE          Log file (default: ~/.log/backup-hdd.log)
  -n, --dry-run           Rsync dry run
  -y, --yes               Skip confirmations
  -h, --help              Show help

Examples:
  sudo ./backup_veracrypt.sh /media/matej/sam/home-backup.hc /media/matej/veracrypt
  sudo ./backup_veracrypt.sh -n --include /path/inc.txt --exclude /path/exc.txt container.hc /mnt/vc
EOF
}

die(){ echo "Error: $*" >&2; exit 1; }
have(){ command -v "$1" >/dev/null 2>&1; }

confirm() {
  [[ "${YES:-0}" == "1" ]] && return 0
  read -r -p "$1 [y/N] " a
  [[ "$a" =~ ^[Yy] ]]
}

notify() {
  have notify-send || return 0
  local u="${SUDO_USER:-$USER}" uid display
  uid="$(id -u "$u" 2>/dev/null || echo 0)"
  display=":$(ls /tmp/.X11-unix/X* 2>/dev/null | sed 's#.*/X##' | head -n1)"
  sudo -u "$u" DISPLAY="$display" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$uid/bus" \
    notify-send "$@" 2>/dev/null || true
}

[[ "${EUID}" -eq 0 ]] || die "Run with sudo."

RUN_AS="${SUDO_USER:-root}"
USER_HOME="$(getent passwd "$RUN_AS" | cut -d: -f6)"
SRC_DIR="$USER_HOME"
INC_LIST="$USER_HOME/.assets/backup_include_pattern.txt"
EXC_LIST="$USER_HOME/.assets/backup_exclude_pattern.txt"
LOG_FILE="$USER_HOME/.log/backup-hdd.log"
YES=0; DRY_RUN=0

pos=()
while [[ $# -gt 0 ]]; do
  case "$1" in
    -s|--source)   SRC_DIR="$2"; shift 2;;
    --include)     INC_LIST="$2"; shift 2;;
    --exclude)     EXC_LIST="$2"; shift 2;;
    -l|--log)      LOG_FILE="$2"; shift 2;;
    -n|--dry-run)  DRY_RUN=1; shift;;
    -y|--yes)      YES=1; shift;;
    -h|--help)     usage; exit 0;;
    *)             pos+=("$1"); shift;;
  esac
done

CONTAINER="${pos[0]:-}"; MOUNT_POINT="${pos[1]:-}"
[[ -n "$CONTAINER" && -n "$MOUNT_POINT" ]] || { usage; exit 2; }

have veracrypt || die "veracrypt not found."
have rsync || die "rsync not found."
[[ -f "$CONTAINER" ]] || die "Container not found: $CONTAINER"
[[ -f "$INC_LIST" ]] || die "Include list not found: $INC_LIST"
[[ -f "$EXC_LIST" ]] || die "Exclude list not found: $EXC_LIST"

sudo -u "$RUN_AS" mkdir -p "$(dirname "$LOG_FILE")"
mkdir -p "$MOUNT_POINT"
exec > >(tee -a "$LOG_FILE") 2>&1

echo "=== Backup plan ($(date -Is)) ==="
printf "user:     %s\nsource:   %s\ncontainer:%s\nmount:    %s\ninclude:  %s\nexclude:  %s\nlog:      %s\ndry-run:  %s\n\n" \
  "$RUN_AS" "$SRC_DIR" "$CONTAINER" "$MOUNT_POINT" "$INC_LIST" "$EXC_LIST" "$LOG_FILE" "$DRY_RUN"

notify "Backup" "Planned backup:\n$SRC_DIR -> $MOUNT_POINT"

confirm "Step 1/4: Dismount ALL VeraCrypt volumes (veracrypt -d)?" && veracrypt -d

confirm "Step 2/4: Mount container to $MOUNT_POINT ?" && veracrypt -k "" --pim=0 --protect-hidden=no -m=nokernelcrypto --mount "$CONTAINER" "$MOUNT_POINT"
echo "Disk usage:"; df -h "$MOUNT_POINT" || true

RSYNC_OPTS=(--archive --verbose --update --times --recursive --human-readable --progress
            --exclude-from="$EXC_LIST" --include-from="$INC_LIST" --exclude="*")
[[ "$DRY_RUN" -eq 1 ]] && RSYNC_OPTS+=(--dry-run)

confirm "Step 3/4: Run rsync now?" && rsync "${RSYNC_OPTS[@]}" "$SRC_DIR"/ "$MOUNT_POINT"/
echo "Rsync exit code: $?"

confirm "Step 4/4: Dismount ALL VeraCrypt volumes (veracrypt -d)?" && veracrypt -d

notify "Backup" "Done.\nlog: $LOG_FILE"
echo "Done."
