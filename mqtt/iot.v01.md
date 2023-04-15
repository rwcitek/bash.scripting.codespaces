# All-in-one broker, subscriber, publisher, Node-RED container

This version is the most similar to what Dr. Brian Rashap does for his IoT class.
What is different is that these commands all run using Docker.
The original commands were meant to all run on the same system.
Therefore, these commands all use the same Docker container.
These commmands have been tested and verify to work with Docker on a Chromebook and on GitHub's CodeSpaces.


## Pull and tag images
```
docker image pull rwcitek/mqtt-red
docker image tag rwcitek/mqtt-red:latest mqtt-red
```


## Remove any existing container
```
docker container stop mqtt-red ; docker container rm mqtt-red
docker container list -a
```

## Create the Docker container environment
```
docker container run -d --name mqtt-red -p 127.0.0.1:1880:1880 mqtt-red \
  sleep inf
docker container list -a
```


## Run a broker in one terminal
```
docker container exec -d mqtt-red \
  mosquitto -c /etc/mosquitto/mosquitto.conf -v
docker container exec mqtt-red ps faux
```


## Run a subscriber in a second terminal
```
docker container exec mqtt-red \
  mosquitto_sub \
    --host localhost \
    --port 1883 \
    --topic feeds/test
```


## Run a publisher in a third terminal
```
docker container exec mqtt-red \
  mosquitto_pub \
    --host localhost \
    --port 1883 \
    --topic feeds/test \
    --message "Hello World"
```


## Run node-RED in a fourth terminal
```
docker container exec -d mqtt-red \
  node-red ; sleep 2
docker container exec mqtt-red netstat -plnt
```

Display info for node-RED
```
echo -e "\n\nNode-RED URL:    http://localhost:1880\n\n"
```



