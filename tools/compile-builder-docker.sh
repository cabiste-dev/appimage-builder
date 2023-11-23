#!/bin/bash

echo '------------ creating new image'
docker buildx build -t appimagebuilder:1 -f tools/Dockerfile .

echo '------------ creating new container'
docker run -dit --name builder123 appimagebuilder:1

echo '--------------- done building'

mkdir -p releases

docker cp -a builder123:/app/recipes/appimage-builder/release/. ./releases/.
echo '--------------- copied files'

echo '--------------- deleting VM'
docker stop builder123
docker rm builder123
docker image rm appimagebuilder:1