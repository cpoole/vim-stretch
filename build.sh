#!/bin/bash

mkdir -p ./output

image_tag="$(basename $PWD | sed 's/_/-/g' | cut -c 1-40 | tr '[:upper:]' '[:lower:]'):$(git rev-parse --short HEAD)"

docker build --tag local/$image_tag .

docker run --rm -v $PWD/output:/output local/$image_tag /bin/bash -c "cp /usr/local/bin/vim /output/"
