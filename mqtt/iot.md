# All-in-one broker, subscriber, publisher, Node-RED container

This version is the most similar to what Dr. Brian Rashap does for his IoT class.
What is different is that these commands all run using Docker.
The original commands were meant to all run on the same system.
Therefore, these commands all use the same Docker container.
These commmands have been tested and verified to work with Docker
on a [Chromebook]( https://gist.github.com/rwcitek/824d4752b417b6d2cd5c931af3db61a6 ),
on [Windows]( https://gist.github.com/rwcitek/f2b6fb5baddf16f6dc1f277a5d9f8366 ), 
and on GitHub's CodeSpaces.


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
Actually, you can run this in any other terminal other than than one with the subscriber ( i.e. the second terminal )
```
docker container exec mqtt-red \
  mosquitto_pub \
    --host localhost \
    --port 1883 \
    --topic feeds/test \
    --message "Hello World"
```


## Run node-RED in a fourth terminal
Actually, you can run this in any other terminal other than than one with the subscriber ( i.e. the second terminal )

Pre-install the Node-RED dashboard ( optional )
```
docker container exec mqtt-red \
  npm install -g --unsafe-perm node-red-dashboard
```

```
docker container exec -d mqtt-red \
  node-red ; sleep 2
docker container exec mqtt-red netstat -plnt ; sleep 2
echo -e "\n\nNode-RED URL:    http://localhost:1880\n\n"
```



