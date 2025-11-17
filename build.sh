#!/bin/bash

rm -rf layer

mkdir layer

docker image build --progress=plain -t openssl-layer .

docker run --rm -v $PWD/layer/:/tmp/layer openssl-layer

ls layer