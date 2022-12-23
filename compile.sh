#!/bin/bash
set -xeuo pipefail
IFS=$'\n\t'

scipy_version="$1"
numpy_version="$2"

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
    scipy==$scipy_version \
    numpy==$numpy_version
