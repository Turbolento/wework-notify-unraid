#!/bin/bash
# Build script for WeWork Notification Agent plugin
# Creates the .txz package and release files
# Usage: ./pkg_build.sh [version]
set -e
VERSION="${1:-2026.07.24}"
PLUGIN="wework-notify"
DIR="$(cd "$(dirname "$0")" && pwd)"
SRC="$DIR/source"
OUT="$DIR/release"

rm -rf "$OUT" && mkdir -p "$OUT"

# Build .txz
cd "$SRC"
tar -cJf "$OUT/${PLUGIN}.txz" --owner=0 --group=0 usr/

# Copy PLG and set version + GitHub URLs
cp "$DIR/${PLUGIN}.plg" "$OUT/${PLUGIN}.plg"
sed -i "s/<!ENTITY version \".*\">/<!ENTITY version \"$VERSION\">/" "$OUT/${PLUGIN}.plg"

echo "Built: $OUT/${PLUGIN}.txz ($(du -h "$OUT/${PLUGIN}.txz" | cut -f1))"
echo "      $OUT/${PLUGIN}.plg"
