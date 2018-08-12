#!/bin/bash

# Run from the directory where this file is (root directory of the PolyShaper_installer project)

# Exit on any error
set -e

SHACO_BUILD_DIR="/Users/flavioprattico/ShaCo/build-ShaCo-Desktop_Qt_5_11_1_clang_64bit-Release"
SHACO_SOURCE_DIR="/Users/flavioprattico/ShaCo/ShaCo"
INKSCAPE_PLUGIN_DIR="/Users/flavioprattico/PolyShaper_inkscape"

MACDEPLOYQT="/Users/flavioprattico/Qt/5.11.1/clang_64/bin/macdeployqt"
ARCHIVEGEN="/Users/flavioprattico/Qt/Tools/QtInstallerFramework/3.0/bin/archivegen"
BINARYCREATOR="/Users/flavioprattico/Qt/Tools/QtInstallerFramework/3.0/bin/binarycreator"

VERSION="1.0.0"

rm -fr installer.macosx/PolyShaper*.app

# First create ShaCo package
cd installer.macosx/packages/eu.polyshaper.shaco/data
rm -f *.7z
cp -a "${SHACO_BUILD_DIR}/app/ShaCo.app" .
"$MACDEPLOYQT" ShaCo.app -qmldir="${SHACO_SOURCE_DIR}/qml"
"$ARCHIVEGEN" shaco.7z ShaCo.app
rm -rf ShaCo.app

# Then the plugin package
cd ../../eu.polyshaper.inkscapeplugin/data
rm -f plugin *.7z
mkdir plugin
cp -a "${INKSCAPE_PLUGIN_DIR}/polyshaper/plugin/polyshaper" "${INKSCAPE_PLUGIN_DIR}/polyshaper/plugin/polyshaper2dplugin.py" "${INKSCAPE_PLUGIN_DIR}/polyshaper/plugin/polyshaper2dplugin.inx" plugin
"$ARCHIVEGEN" plugin.7z plugin
rm -fr plugin

# Finally create installer
cd ../../..
"$BINARYCREATOR" -c config/config.xml -p packages "PolyShaper-${VERSION}"

echo "Done"
