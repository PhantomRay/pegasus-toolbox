FROM alpine:3

ARG SRC_VERSION=unknown

RUN apk add --no-cache \
    bash \
    curl \
    gnupg \
    aws-cli \
    mongodb-tools \
    postgresql17-client

ENV SRC_VERSION=$SRC_VERSION

WORKDIR /home

# Default command
CMD ["/bin/sh"]
