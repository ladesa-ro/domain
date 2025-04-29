#!/usr/bin/env bash

set -euo pipefail;

# CONTAINER_FILE=$(cat <<'EOF'
# FROM docker.io/oven/bun:1
# RUN bun install -g quicktype@latest
# ENTRYPOINT [ "quicktype" ]
# EOF
# )

# echo "${CONTAINER_FILE}" | podman build -;

# IMG_SHA=$(echo "${CONTAINER_FILE}" | podman build - -q;)

# podman run --rm -v $(pwd):/pwd -w /pwd -it ${IMG_SHA} $@;

bunx quicktype@22 $@;
