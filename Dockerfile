FROM ghcr.io/actions/actions-runner:2.308.0

USER root

RUN apt update -y && \
  apt-get upgrade -y && \
  apt install -y git-core rsync && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

USER runner
