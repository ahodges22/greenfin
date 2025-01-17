FROM ghcr.io/ublue-os/bluefin-dx:stable-daily

COPY build.sh /tmp/build.sh
COPY build_scripts/ /tmp

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit && \
    bootc container lint
