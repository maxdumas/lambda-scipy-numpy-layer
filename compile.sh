#!/bin/bash
set -xeuo pipefail
IFS=$'\n\t'

cp /usr/lib/x86_64-linux-gnu/libopenblas.so.0 /var/task

cp /usr/lib/x86_64-linux-gnu/liblapack.so.3 /var/task 

pip install \
    --no-cache-dir \
    --compile \
    --global-option=build_ext \
    --global-option='-j 8' \
    -t python/ \
    scipy==1.8.1 \
    numpy==1.23.0
