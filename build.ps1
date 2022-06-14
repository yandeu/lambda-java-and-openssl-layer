#!/bin/pwsh

Remove-Item layer/layer.zip

Remove-Item -r layer -Force

docker image build -t openssl-layer .

docker run --rm -v $PWD/layer/:/tmp/layer openssl-layer