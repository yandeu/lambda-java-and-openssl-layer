#!/bin/bash

ts=$(date +%s)
cd /tmp/layer && \
  mkdir -p bin && \
  mkdir -p lib && \
  echo copy java with keytool && \
  cp -rf /usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/jre/bin/* ./bin && \
  cp -rf /usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/jre/lib/* ./lib && \
  echo copy openssl && \
  cp /bin/openssl ./bin/openssl && \
  cp /usr/lib64/libbz2.so.1 ./lib && \
  cp /usr/lib64/libssl.so.3 ./lib && \
  cp /usr/lib64/libssl.so.3.2.2 ./lib && \
  cp /usr/lib64/libssl3.so ./lib && \
  cp /usr/lib64/libcrypto.so.3 ./lib && \
  cp /usr/lib64/libcrypto.so.3.2.2 ./lib && \
  echo zip all files && \
  zip -8 -r layer-${ts}.zip  ./* && \
  rm -rf lib bin