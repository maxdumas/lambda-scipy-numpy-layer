#!/bin/bash
set -xeuo pipefail
IFS=$'\n\t'

python_version="$1"
scipy_version="$2"
numpy_version="$3"
platform="${4:-'linux/amd64'}"

image_id=build-image

docker build . --platform linux/amd64 -t $image_id --build-arg PYTHON_VERSION=$python_version 

docker run --platform linux/amd64 -v "$PWD":/var/task $image_id /var/task/compile.sh $scipy_version $numpy_version

cd layer

zip -9 -r scipy-$scipy_version_numpy-$numpy_version.zip .
