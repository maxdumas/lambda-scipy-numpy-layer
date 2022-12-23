#!/bin/bash
set -xeuo pipefail
IFS=$'\n\t'

mkdir -p layer/lib
cp /usr/lib64/libblas.so.3 layer/lib
cp /usr/lib64/liblapack.so.3 layer/lib
cp /usr/lib64/libgfortran.so.4 layer/lib
cp /usr/lib64/libquadmath.so.0 layer/lib

pip install \
    -vvv \
    --no-cache-dir \
    --compile \
    --global-option=build_ext \
    --global-option='-j 8' \
    -t layer/python \
    scipy==1.8.1 \
    numpy==1.23.0
