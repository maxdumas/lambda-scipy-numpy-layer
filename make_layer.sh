#!/bin/bash
set -xeuo pipefail
IFS=$'\n\t'

image_id=build-image

docker build . --platform linux/amd64 -t $image_id

docker run --platform linux/amd64 -v "$PWD":/var/task $image_id /var/task/compile.sh

zip -9 -r scipy-1.8.1_numpy-1.23.0.zip python lib
