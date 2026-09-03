FROM ghcr.io/actions/actions-runner:2.337.0@sha256:e5496277be5d09bc968b3d64911b74e219ac4a3f2edce956a3ecf9271bea1ef4

USER root

# renovate: datasource=github-releases depName=docker/compose
ENV DOCKER_COMPOSE_VERSION=5.5.1

RUN apt update -y && \
  apt-get upgrade -y && \
  apt install -y \
    git-core \
    rsync \
    curl \
    zip && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ARG TARGETARCH

RUN case "${TARGETARCH}" in \
    'amd64') \
      curl -sSLo /usr/bin/docker-compose https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64; \
      curl -sSLo /tmp/awscli.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip; \
      ;; \
    'arm64') \
      curl -sSLo /usr/bin/docker-compose https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64; \
      curl -sSLo /tmp/awscli.zip https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip; \
      ;; \
    *) echo >&2 "error: unsupported architecture '${TARGETARCH}'"; exit 1 ;; \
  esac && \
  chmod u=rwx,g=rx,o=rx /usr/bin/docker-compose && \
  cd /tmp && \
  unzip awscli.zip && \
  ./aws/install && \
  rm -rf awscli.zip aws

USER runner
