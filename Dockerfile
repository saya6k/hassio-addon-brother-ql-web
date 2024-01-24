ARG BUILD_FROM=ghcr.io/hassio-addons/ubuntu-base:9.0.2

# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install Brother-QL-Web
ARG APP_DIR=/app
RUN \
    apt-get update \
    \
    && apt-get install -y --no-install-recommends \
        git \
        build-essential \
        cmake \
        python3.10 \
        python3-dev \
        python3-pip \
        fontconfig \
        poppler-utils \
    \
    && git clone https://github.com/dersimn/brother_ql_web.git ${APP_DIR} --branch v2.1.7 \
    && python3 -m pip install -r ${APP_DIR}/requirements.txt \
    && apt-get purge -y --auto-remove \
        git \
        build-essential \
        cmake \
        python3-dev \
    && apt-get clean \
    && rm -fr \
        /tmp/* \
        /var/{cache,log}/* \
        /var/lib/apt/lists/*

# Copy root filesystem for our image
COPY rootfs /

# Build arugments
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION
ARG BUILD_REPOSITORY

# Labels
LABEL \
    io.hass.name="brother-ql-web for ${BUILD_ARCH}" \
    io.hass.description="Home Assistant Community Add-on: ${BUILD_ARCH} Brother-QL-Web" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="github.com/saya6k" \
    org.opencontainers.image.title="Brother-QL-Web for ${BUILD_ARCH}" \
    org.opencontainers.image.description="Home Assistant Community Add-on: ${BUILD_ARCH} Brother-QL-Web" \
    org.opencontainers.image.vendor="Home Assistant Community Add-ons" \
    org.opencontainers.image.authors="github.com/saya6k" \
    org.opencontainers.image.licenses="GPLv3" \
    org.opencontainers.image.url="https://addons.community" \
    org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
    org.opencontainers.image.documentation="https://github.com/${BUILD_REPOSITORY}/blob/master/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}