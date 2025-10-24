FROM amazonlinux:2023.9.20250929.0

# all available packages for AL2023.9:
# https://docs.aws.amazon.com/linux/al2023/release-notes/all-packages-AL2023.9.html

# access keytool via "keytool"
# access openssl via "openssl"

RUN yum install openssl -y
RUN yum install zip -y
RUN yum install java-1.8.0-amazon-corretto -y
RUN mkdir -p /tmp/layer

# find where it is installed
# RUN rpm -ql java-1.8.0-amazon-corretto

CMD cd /tmp/layer && \
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
  zip -8 -r layer.zip ./* && \
  rm -rf lib bin