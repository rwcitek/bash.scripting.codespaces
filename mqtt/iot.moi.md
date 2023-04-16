# Most-in-one Node-RED, subscriber, publisher container

This version is similar to the original version,
but differs in that it uses the public broker at \[[mqtt.eclipseprojects.io]( https://mqtt.eclipseprojects.io/ )\].

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


## Create the Docker container environment in a terminal
```
docker container run -d --name mqtt-red -p 127.0.0.1:1880:1880 mqtt-red \
  sleep inf
docker container list -a
```


## Run node-RED
Pre-install the Node-RED dashboard ( optional )
```
docker container exec mqtt-red \
  npm install -g --unsafe-perm node-red-dashboard
```

```
docker container exec -d mqtt-red \
  node-red ; sleep 2
docker container exec mqtt-red netstat -plnt
echo -e "\n\nNode-RED URL:    http://localhost:1880\n\n"
```


## Run a subscriber
```
docker container exec mqtt-red \
  mosquitto_sub \
    --host mqtt.eclipseprojects.io \
    --port 1883 \
    --topic feeds/test
```


## Run a publisher in a second terminal
```
docker container exec mqtt-red \
  mosquitto_pub \
    --host mqtt.eclipseprojects.io \
    --port 1883 \
    --topic feeds/test \
    --message "Hello World"
```




