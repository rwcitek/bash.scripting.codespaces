FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install Java, X11 dependencies, fonts, and noVNC
RUN apt-get update && apt-get install -y \
    openjdk-17-jre \
    x11-apps \
    x11-utils \
    fonts-dejavu \
    fontconfig \
    wget \
    tar \
    x11vnc \
    xvfb \
    novnc \
    websockify \
    openbox \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt
# Fetch NetLogo 7.0.4 archive
RUN wget https://downloads.netlogo.org/7.0.4/NetLogo-7.0.4-64.tgz \
    && tar -xzf NetLogo-7.0.4-64.tgz \
    && rm NetLogo-7.0.4-64.tgz

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 6080

ENTRYPOINT ["/entrypoint.sh"]

COPY Dockerfile /

## build
# docker build -t netlogo-web-app .

## run
# docker run --rm -d -p 6080:6080 --name netlogo-container netlogo-web-app

## stop
# docker container stop netlogo-container

