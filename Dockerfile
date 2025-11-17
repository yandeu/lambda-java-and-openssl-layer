FROM amazonlinux:2023.9.20250929.0

# all available packages for AL2023.9:
# https://docs.aws.amazon.com/linux/al2023/release-notes/all-packages-AL2023.9.html

# access keytool via "keytool"
# access openssl via "openssl"

RUN yum install openssl -y
RUN yum install zip -y
RUN yum install java-1.8.0-amazon-corretto -y

# find where it is installed
# RUN rpm -ql java-1.8.0-amazon-corretto

RUN mkdir -p /tmp/layer

COPY build-layer.sh build-layer.sh

ENTRYPOINT ["/bin/bash"]

CMD ["build-layer.sh"]