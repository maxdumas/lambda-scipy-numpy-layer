#!/bin/bash
set -xeuo pipefail
IFS=$'\n\t'

image_id=$(docker build . --platform linux/amd64)

docker run --platform linux/amd64 -v "$PWD":/var/task $image_id compile.sh

zip -9 -r scipy-1.8.1_numpy-1.23.0.zip python
