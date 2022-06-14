FROM amazonlinux:2

# access keytool via "keytool"
# access openssl via "openssl"

RUN yum install openssl11 -y
RUN yum install zip -y
RUN yum install java-1.8.0-openjdk-headless.x86_64 -y
RUN mkdir -p /tmp/layer

# find where it is installed
# RUN rpm -ql java-1.8.0-openjdk-headless.x86_64

CMD cd /tmp/layer && \
  mkdir -p bin && \
  mkdir -p lib && \
  echo copy java with keytool && \
  cp -rf /usr/lib/jvm/jre/bin/* ./bin && \
  cp -rf /usr/lib/jvm/jre/lib/* ./lib && \
  echo copy openssl && \
  cp /bin/openssl11 ./bin/openssl && \
  cp /usr/lib64/libbz2.so.1 ./lib && \
  cp /usr/lib64/libssl.so.1.1 ./lib && \
  cp /usr/lib64/libcrypto.so.1.1 ./lib && \
  echo zip all files && \
  zip -8 -r layer.zip ./* && \
  rm -rf lib bin