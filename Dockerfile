FROM ghcr.io/actions/actions-runner:2.330.0

USER root

# renovate: datasource=github-releases depName=docker/compose
ENV DOCKER_COMPOSE_VERSION=2.21.0

RUN apt update -y && \
  apt-get upgrade -y && \
  apt install -y \
    git-core \
    rsync \
    curl \
    zip \
    libglib2.0-0 \
    libnss3 \
    libnspr4 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libdbus-1-3 \
    libxkbcommon0 \
    libatspi2.0-0 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libgbm1 \
    libpango-1.0-0 \
    libcairo2 \
    libasound2 && \
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
