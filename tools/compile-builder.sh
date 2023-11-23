#!/bin/bash

cd /app || exit

# python3.8 -m venv env
# source ./env/bin/activate
pip3 install --upgrade pip
pip3 install -r requirements.txt
export PYTHONPATH=$("pwd")

echo "FINISHED DOWNLOADING PIPS"

cd recipes/appimage-builder || exit

export APPIMAGE_BUILDER_VERSION=v2.0.0
python3 -m appimagebuilder

mkdir release
cp -a appimage-builder-* release/.