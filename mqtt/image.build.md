
# Dockerfile to build mosquitto-node-red image

## Build an image
Create the Dockerfile
```
<<'eof' cat > Dockerfile
FROM ubuntu:22.04

SHELL ["/bin/bash", "-c"]
ENV  DEBIAN_FRONTEND=noninteractive

# Install software packages
RUN  apt-get update && \
     apt-get install -y --no-install-recommends \
       curl \
       iputils-ping \
       jq \
       less \
       mosquitto \
       mosquitto-clients \
       net-tools \
       npm \
       telnet \
       tree \
       vim \
       ;

# Install node-red via npm
RUN  npm install -g --unsafe-perm node-red

# Configure mqtt broker
RUN  echo -e 'allow_anonymous true\nlistener 1883' > /etc/mosquitto/conf.d/setup.conf
RUN  mkdir /run/mosquitto/
RUN  chown mosquitto: /run/mosquitto/

# Default container setup
CMD ["/bin/bash"]
COPY Dockerfile /

eof
```

Build the Docker image

```
docker image build --tag mqtt-red:latest .
```

## Tag+push and pull+tag image

```
mqtt-red.tag.push () {
  tag=$(date +%s)
  time -p {
    docker image tag mqtt-red:latest  rwcitek/mqtt-red:${tag}
    docker image tag rwcitek/mqtt-red:${tag} rwcitek/mqtt-red:latest
    docker image push rwcitek/mqtt-red:${tag} 
    docker image push rwcitek/mqtt-red:latest 
  }
}
```

```
mqtt-red.pull () {
  time -p {
    docker image pull rwcitek/mqtt-red
    docker image tag rwcitek/mqtt-red:latest mqtt-red
    docker image tag rwcitek/mqtt-red:latest mosquitto
  }
}
```


