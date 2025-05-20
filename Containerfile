FROM mcr.microsoft.com/vscode/devcontainers/base:debian AS base
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update -y;

FROM base AS devcontainer

RUN apt install -y git unzip curl jq libicu-dev;

ARG DOTNET_SDK_INSTALL_URL=https://dot.net/v1/dotnet-install.sh
ENV DOTNET_INSTALL_DIR=/usr/share/dotnet

RUN cd /tmp \
    && curl --location --output dotnet-install.sh "${DOTNET_SDK_INSTALL_URL}" \
    && chmod +x dotnet-install.sh \
    && mkdir -p "${DOTNET_INSTALL_DIR}" \
    && ./dotnet-install.sh --channel 9.0 --install-dir "${DOTNET_INSTALL_DIR}" \
    && rm dotnet-install.sh
ENV PATH="${PATH}:${DOTNET_INSTALL_DIR}"

RUN dotnet workload update

ENV BUN_INSTALL=/usr/local
ENV BUN_INSTALL_CACHE_DIR=/usr/lib/bun/cache

RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="${PATH}:${BUN_INSTALL}/bin"
