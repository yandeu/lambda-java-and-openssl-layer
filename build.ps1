#!/bin/pwsh

if (Test-Path layer) {
  Remove-Item layer -force -recurse
}

docker image build -t openssl-layer .

docker run --rm -v $PWD/layer/:/tmp/layer openssl-layer

Get-ChildItem layer