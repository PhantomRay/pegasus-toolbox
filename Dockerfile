FROM alpine:3

RUN apk add --no-cache \
    bash \
    curl \
    gnupg \
    aws-cli \
    mongodb-tools \
    postgresql17-client

# Set working directory
WORKDIR /home

# Default command
CMD ["/bin/sh"]
