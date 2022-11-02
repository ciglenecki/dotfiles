current_desktop_id="$(wmctrl -d | grep '*' | cut -d ' ' -f1)"
# get all windows
# focus only the ones with current desktop
# only leave out the title of the windows
# focus them
# wmctrl -pl | awk -F " " '$2=='"$current_desktop_id" | tr -s ' ' | cut -d ' ' -f 5- | xargs -L 1 wmctrl -ax
wmctrl -pl | awk -F " " '$2=='"$current_desktop_id" | tr -s ' ' | cut -d ' ' -f 1 | xargs -L 1 wmctrl -ia
