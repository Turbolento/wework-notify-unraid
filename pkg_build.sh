#!/bin/bash
# Build script for WeWork Notification Agent plugin
# Packages the source/ directory into a Slackware-format .txz package
#
# Usage: ./pkg_build.sh [version]
# Example: ./pkg_build.sh 2026.07.11

set -e

VERSION="${1:-2026.07.11}"
PLUGIN_NAME="wework-notify"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="${SCRIPT_DIR}/source"
OUTPUT_DIR="${SCRIPT_DIR}/release"

# Create output directory
mkdir -p "${OUTPUT_DIR}"

# Copy agent script into the source tree so it gets packaged
mkdir -p "${SOURCE_DIR}/usr/local/emhttp/plugins/${PLUGIN_NAME}/agent"
cp "${SCRIPT_DIR}/agent/wework" "${SOURCE_DIR}/usr/local/emhttp/plugins/${PLUGIN_NAME}/agent/wework"
chmod +x "${SOURCE_DIR}/usr/local/emhttp/plugins/${PLUGIN_NAME}/agent/wework"

# Build Slackware package
cd "${SOURCE_DIR}"
makepkg -l y -c n "${OUTPUT_DIR}/${PLUGIN_NAME}-${VERSION}.txz"

# Also create a version-less symlink for the PLG to reference
cd "${OUTPUT_DIR}"
ln -sf "${PLUGIN_NAME}-${VERSION}.txz" "${PLUGIN_NAME}.txz"

echo ""
echo "Package built: ${OUTPUT_DIR}/${PLUGIN_NAME}-${VERSION}.txz"
echo "Symlink: ${OUTPUT_DIR}/${PLUGIN_NAME}.txz"
echo ""

# Generate MD5 for the PLG file
if command -v md5sum &> /dev/null; then
    echo "MD5: $(md5sum "${OUTPUT_DIR}/${PLUGIN_NAME}-${VERSION}.txz" | cut -d' ' -f1)"
elif command -v md5 &> /dev/null; then
    echo "MD5: $(md5 -q "${OUTPUT_DIR}/${PLUGIN_NAME}-${VERSION}.txz")"
fi
