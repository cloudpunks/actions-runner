FROM ghcr.io/actions/actions-runner:2.308.0

USER root

# renovate: datasource=github-releases depName=docker/compose
ENV DOCKER_COMPOSE_VERSION=2.21.0

RUN apt update -y && \
  apt-get upgrade -y && \
  apt install -y git-core rsync curl && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN curl -sSLo /usr/bin/docker-compose https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64 && \
  chmod u=rwx,g=rx,o=rx /usr/bin/docker-compose

USER runner
