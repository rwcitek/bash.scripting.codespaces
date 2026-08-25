FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Install prerequisites
RUN apt-get update && apt-get install -y \
    software-properties-common \
    gnupg \
    wget \
    x11vnc \
    xvfb \
    novnc \
    websockify \
    openbox \
    fonts-liberation \
    && rm -rf /var/lib/apt/lists/*

# Add xtradeb PPA for native non-snap Chromium .deb packages
RUN add-apt-repository ppa:xtradeb/apps -y \
    && apt-get update \
    && apt-get install -y chromium \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 6080

ENTRYPOINT ["/entrypoint.sh"]

COPY Dockerfile /

## build
# docker build -t chromium .

## run
# docker run --rm -d -p 6080:6080 --name chromium-container chromium

## stop
# docker container stop chromium-container

