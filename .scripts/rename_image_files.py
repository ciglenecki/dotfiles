#!/usr/bin/env python3
"""
Rename and copy images into a target directory with normalized timestamps.

New filenames:
    YYYY-MM-DD-HH-MM-SS-XXXX.jpg
where XXXX is a zero-padded, auto-incrementing integer.
"""

from __future__ import annotations

import argparse
import logging
import re
import shutil
import sys
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path
from typing import Final

from PIL import ExifTags, Image

# allowed image extensions (normalized to lowercase)
# ALLOWED_EXTENSIONS: Final[set[str]] = {".jpg", ".jpeg", ".jpe", ".jfif"}

# precompiled filename patterns
# pattern: 2024-12-28-14-20-22-1095.jpg (ignore trailing counter)
_PATTERN_FULL_WITH_DASHES: Final[re.Pattern[str]] = re.compile(
    r"(?P<year>\d{4})-(?P<month>\d{2})-(?P<day>\d{2})-"
    r"(?P<hour>\d{2})-(?P<minute>\d{2})-(?P<second>\d{2})"
)

# pattern: 20251114_131704.jpg
_PATTERN_COMPACT_DATETIME: Final[re.Pattern[str]] = re.compile(
    r"(?P<date>\d{8})_(?P<time>\d{6})"
)

# pattern: IMG-20240630-WA0045.jpg, VID-20250409-WA0014.jpg
_PATTERN_WA_DATE: Final[re.Pattern[str]] = re.compile(
    r"(?P<prefix>IMG|VID)-(?P<date>\d{8})-WA\d+",
    flags=re.IGNORECASE,
)

# generic 8-digit date anywhere in the name
_PATTERN_DATE_ONLY: Final[re.Pattern[str]] = re.compile(r"(?<!\d)(?P<date>\d{8})(?!\d)")

# exif datetime formats to try
EXIF_TIME_FORMATS: Final[list[str]] = [
    "%Y:%m:%d %H:%M:%S",
    "%Y-%m-%d %H:%M:%S",
]


@dataclass(slots=True)
class ProcessedImage:
    """Information about an image to be copied and renamed."""

    source_path: Path
    timestamp: datetime
    timestamp_source: str  # "exif", "name", "modified"


def is_image_file(path: Path) -> bool:
    """Return True if path looks like a supported image file.

    Args:
        path: Path to check.

    Returns:
        True if file extension is a supported image type, False otherwise.
    """
    # return path.is_file() and path.suffix.lower() in ALLOWED_EXTENSIONS
    return path.is_file()


def get_exif_datetime(path: Path) -> datetime | None:
    """Extract timestamp from image EXIF, if available.

    Args:
        path: Path to image file.

    Returns:
        Datetime from EXIF if found and parseable, otherwise None.
    """
    try:
        with Image.open(path) as img:
            exif = img._getexif()  # type: ignore[attr-defined]
    except Exception:
        # exif not readable or not present
        return None

    if not exif:
        return None

    # build tag-name-indexed mapping once per image
    tagged: dict[str, str] = {}
    for tag_id, value in exif.items():
        name = ExifTags.TAGS.get(tag_id)
        if not name:
            continue
        if not isinstance(value, str):
            continue
        tagged[name] = value

    for key in ("DateTimeOriginal", "DateTimeDigitized", "DateTime"):
        value = tagged.get(key)
        if not value:
            continue
        for fmt in EXIF_TIME_FORMATS:
            try:
                return datetime.strptime(value, fmt)
            except ValueError:
                # try next format
                continue

    return None


def parse_yyyymmdd(value: str) -> datetime:
    """Parse YYYYMMDD into datetime at midnight.

    Args:
        value: Eight-digit date string.

    Returns:
        Datetime set to midnight of parsed date.
    """
    year = int(value[0:4])
    month = int(value[4:6])
    day = int(value[6:8])
    return datetime(year=year, month=month, day=day)


def get_datetime_from_name(name: str) -> datetime | None:
    """Try to extract a timestamp from an image file name.

    Supports formats, for example:
    - 20251114_131704.jpg
    - IMG-20240630-WA0045.jpg
    - VID-20250409-WA0014.jpg
    - 2024-12-28-14-20-22-1095.jpg

    Args:
        name: File name (with or without extension).

    Returns:
        Datetime if a supported pattern is matched, otherwise None.
    """
    stem = Path(name).stem

    match = _PATTERN_FULL_WITH_DASHES.search(stem)
    if match:
        try:
            return datetime(
                year=int(match.group("year")),
                month=int(match.group("month")),
                day=int(match.group("day")),
                hour=int(match.group("hour")),
                minute=int(match.group("minute")),
                second=int(match.group("second")),
            )
        except ValueError:
            # invalid date/time in name
            return None

    match = _PATTERN_COMPACT_DATETIME.search(stem)
    if match:
        date_str = match.group("date")
        time_str = match.group("time")
        try:  # simple validated parse
            date_obj = parse_yyyymmdd(value=date_str)
            hour = int(time_str[0:2])
            minute = int(time_str[2:4])
            second = int(time_str[4:6])
            return datetime(
                year=date_obj.year,
                month=date_obj.month,
                day=date_obj.day,
                hour=hour,
                minute=minute,
                second=second,
            )
        except ValueError:
            return None

    match = _PATTERN_WA_DATE.search(stem)
    if match:
        date_str = match.group("date")
        try:
            # no time information, default to midnight
            return parse_yyyymmdd(value=date_str)
        except ValueError:
            return None

    match = _PATTERN_DATE_ONLY.search(stem)
    if match:
        date_str = match.group("date")
        try:
            return parse_yyyymmdd(value=date_str)
        except ValueError:
            return None

    return None


def determine_image_timestamp(path: Path) -> tuple[datetime, str]:
    """Determine best available timestamp for an image.

    Preference order:
    1. EXIF data
    2. Structured filename
    3. Filesystem modified time

    Args:
        path: Path to image file.

    Returns:
        Tuple of:
        - Resolved datetime
        - Source label: "exif", "name", or "modified"
    """
    exif_dt = get_exif_datetime(path=path)
    if exif_dt:
        return exif_dt, "exif"

    name_dt = get_datetime_from_name(name=path.name)
    if name_dt:
        return name_dt, "name"

    mtime = datetime.fromtimestamp(path.stat().st_mtime)
    return mtime, "modified"


def collect_images(src_dir: Path) -> list[ProcessedImage]:
    """Collect image files and resolve timestamps.

    Recursively walks the source directory to find supported image files.

    Args:
        src_dir: Root directory to search.

    Returns:
        List of ProcessedImage objects with resolved timestamps.
    """
    images: list[ProcessedImage] = []

    for path in src_dir.rglob("*"):
        if path and not is_image_file(path=path):
            continue
        timestamp, source = determine_image_timestamp(path=path)
        images.append(
            ProcessedImage(
                source_path=path,
                timestamp=timestamp,
                timestamp_source=source,
            )
        )

    return images


def build_target_path(
    dst_dir: Path,
    timestamp: datetime,
    start_index: int,
    extension: str,
) -> tuple[Path, int]:
    """Build a unique target path for an image.

    Ensures there is no filename collision in the destination directory by
    incrementing the index until a free name is found.

    Args:
        dst_dir: Destination directory.
        timestamp: Timestamp to encode into the filename.
        start_index: Starting integer suffix for this search.

    Returns:
        Tuple of:
        - Unique target path.
        - The index used for the returned path.
    """
    base = timestamp.strftime("%Y-%m-%d-%H-%M-%S")
    index = start_index

    while True:
        candidate = dst_dir / f"{base}-{index:04d}{extension}"
        if not candidate.exists():
            return candidate, index
        index += 1


def process_images(src_dir: Path, dst_dir: Path) -> None:
    """Process all images from source directory into destination.

    Images are:
    - Scanned recursively from the source directory.
    - Assigned timestamps based on EXIF, filename, or modified time.
    - Sorted by timestamp and name.
    - Copied into the destination directory with normalized filenames.

    Args:
        src_dir: Directory containing input images.
        dst_dir: Directory where renamed copies will be written.
    """
    src_dir = src_dir.resolve()
    dst_dir = dst_dir.resolve()

    if not src_dir.is_dir():
        raise SystemExit(
            f"Source directory does not exist or is not a directory: {src_dir}"
        )

    try:
        # prevent destination inside source to avoid infinite recursion
        if dst_dir == src_dir or dst_dir.is_relative_to(src_dir):
            raise SystemExit(
                "Destination directory must not be inside the source directory."
            )
    except AttributeError:
        # older Python versions (not relevant for 3.12) would not have is_relative_to
        pass

    dst_dir.mkdir(parents=True, exist_ok=True)

    images = collect_images(src_dir=src_dir)
    if not images:
        print(f"No images found in {src_dir}")
        return

    # sort deterministically by timestamp then by original path
    images.sort(key=lambda img: (img.timestamp, str(img.source_path).lower()))

    stats = {"exif": 0, "name": 0, "modified": 0}
    sequence = 1

    for img in images:
        stats[img.timestamp_source] = stats.get(img.timestamp_source, 0) + 1
        target_path, used_index = build_target_path(
            dst_dir=dst_dir,
            timestamp=img.timestamp,
            start_index=sequence,
            extension=img.source_path.suffix.lower(),
        )
        sequence = used_index + 1

        logging.debug(
            "Copying %s -> %s (timestamp=%s, source=%s)",
            img.source_path,
            target_path,
            img.timestamp.isoformat(sep=" "),
            img.timestamp_source,
        )

        shutil.copy2(src=img.source_path, dst=target_path)

    total = sum(stats.values())
    print(f"Processed {total} images.")
    print(f"Destination: {dst_dir}")
    print("Timestamp sources:")
    print(f"  EXIF:          {stats.get('exif', 0)}")
    print(f"  From filename: {stats.get('name', 0)}")
    print(f"  Modified time: {stats.get('modified', 0)}")


def parse_args(argv: list[str] | None = None) -> argparse.Namespace:
    """Parse command-line arguments.

    Args:
        argv: Optional list of arguments to parse. Defaults to sys.argv.

    Returns:
        Parsed arguments namespace.
    """
    parser = argparse.ArgumentParser(
        description=(
            "Copy images from a source directory into a destination directory, "
            "renaming them to normalized timestamps using EXIF, filename, or "
            "modified time."
        )
    )
    parser.add_argument(
        "--src_dir",
        help="Source directory containing images.",
        required=True,
    )
    parser.add_argument(
        "--dst_dir",
        help="Destination directory for renamed copies.",
        required=True,
    )
    parser.add_argument(
        "--log-level",
        default="INFO",
        choices=["DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"],
        help="Logging verbosity (default: INFO).",
    )

    return parser.parse_args(args=argv)


def main() -> None:
    """Entry point."""
    args = parse_args()
    logging.basicConfig(
        level=getattr(logging, args.log_level.upper(), logging.INFO),
        format="%(levelname)s: %(message)s",
    )

    process_images(
        src_dir=Path(args.src_dir),
        dst_dir=Path(args.dst_dir),
    )


if __name__ == "__main__":
    main()
