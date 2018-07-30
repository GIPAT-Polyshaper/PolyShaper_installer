#!/bin/bash

# Run from the directory where this file is (root directory of the PolyShaper_installer project)
# Drivers are not updated, we expect the drivers package to be already in eu.polyshaper.drivers/data

# Exit on any error
set -e

SHACO_BUILD_DIR="C:/Users/tomas/Desktop/ShaCo/build-ShaCo-Desktop_Qt_5_11_1_MinGW_32bit-Release"
SHACO_SOURCE_DIR="C:/Users/tomas/Desktop/ShaCo/ShaCo"
INKSCAPE_PLUGIN_DIR="C:/Users/tomas/Desktop/PolyShaper_inkscape"

WINDEPLOYQT="C:/Qt/5.11.1/mingw53_32/bin/windeployqt.exe"
ARCHIVEGEN="C:/Qt/Tools/QtInstallerFramework/3.0/bin/archivegen"
BINARYCREATOR="C:/Qt/Tools/QtInstallerFramework/3.0/bin/binarycreator"

VERSION="0.9"

rm -f installer.win32/PolyShaper*.exe

# First create ShaCo package
cd installer.win32/packages/eu.polyshaper.shaco/data
rm -fr tmp *.7z
mkdir tmp
cd tmp
cp "${SHACO_BUILD_DIR}/app/release/ShaCo.exe" .
export PATH=$PATH:/c/Qt/Tools/mingw530_32/bin/:/c/Qt/5.11.1/mingw53_32/bin/
"$WINDEPLOYQT" --qmldir "${SHACO_SOURCE_DIR}/qml" ShaCo.exe
"$ARCHIVEGEN" shaco.7z *
mv shaco.7z ..
cd ..
rm -rf tmp

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
