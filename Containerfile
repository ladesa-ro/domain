FROM debian:12 AS base
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update -y;

FROM base AS devcontainer

RUN apt install -y git unzip curl;

ENV BUN_INSTALL=/usr/local
ENV BUN_INSTALL_CACHE_DIR=/usr/lib/bun/cache

RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="${PATH}:${BUN_INSTALL}/bin"

ARG USERNAME=debian
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

RUN apt install -y sudo \
    && echo "${USERNAME} ALL=(root) NOPASSWD: ALL" > /etc/sudoers.d/debian

RUN mkdir -p /var/lib/ladesa-ro/sources/domain \
    && chown -R debian:debian /var/lib/ladesa-ro/sources/domain

RUN mkdir -p /usr/lib/bun \
    && chown -R debian:debian /usr/lib/bun

USER debian

FROM devcontainer AS devcontainer-ci

COPY . /var/lib/ladesa-ro/sources/domain
WORKDIR /var/lib/ladesa-ro/sources/domain
RUN bun install --frozen-lockfile;
