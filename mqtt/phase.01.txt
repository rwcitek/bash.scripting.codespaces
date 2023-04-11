
# === Subscriber and publisher in single container, eclipse broker

# remove any existing container
docker container stop mosquitto ; docker container rm mosquitto


# start the instance in the background ( and create an image, if needed )
docker image list -a | grep -q mosquitto && 
docker container run -d --name mosquitto mosquitto sleep inf || {
docker container run -d --name mosquitto ubuntu:22.04 sleep inf

# install mosquitto and suite of tools
docker container exec -i mosquitto /bin/bash  << 'eof'
  export DEBIAN_FRONTEND=noninteractive
  apt-get update &&
  apt-get install -y --no-install-recommends \
    mosquitto \
    mosquitto-clients \
    curl \
    iputils-ping \
    less \
    net-tools \
    telnet \
    tree \
    vim \
    ;
eof

# create image
docker container commit mosquitto mosquitto
}


# run a subscriber
docker container exec -i mosquitto /bin/bash << 'eof'
  # run a subscriber
  mosquitto_sub \
    --host mqtt.eclipseprojects.io \
    --topic CNMI/IoT |
    tee /tmp/sub.log
eof


# run a publisher
docker container exec -i mosquitto /bin/bash << 'eof'
  # run a publisher, publishing to mqtt.eclipseprojects.io
  for i in {1..10} ; do
    mosquitto_pub \
      --host mqtt.eclipseprojects.io \
      --topic CNMI/IoT \
      --message "$( date --iso=s ) MQTT Client"
    sleep 1
  done
eof


# examine log file of messages
docker container exec mosquitto cat -n /tmp/sub.log


# work inside container
docker container exec -it mosquitto /bin/bash






