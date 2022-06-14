#!/bin/bash

rm -rf layer/layer.zip

rm -rf layer

docker image build -t openssl-layer .

docker run --rm -v $PWD/layer/:/tmp/layer openssl-layer

ls layer