#!/bin/bash
cd $(dirname $0)
QT_DIR="$HOME/Qt/6.12.0/macos"
cmake ./ -DCMAKE_PREFIX_PATH="$QT_DIR"
make
"$QT_DIR/bin/macdeployqt" Hayaemon.app
# Apple Silicon (and current Gatekeeper policy in general) refuses to run
# any binary with no code signature at all, so ad-hoc sign everything
# macdeployqt just bundled in.
codesign --force --deep --sign - Hayaemon.app
rm *.h
rm *.cpp
rm cmake_install.cmake
rm CMakeCache.txt
rm Makefile
rm -r CMakeFiles
rm -r Hayaemon_autogen
