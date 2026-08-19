# Networking example

This section builds a network of four (4) Docker containers
each having some networking tools and running an nginx web server.

## Setup

This builds the image, if needed, and starts the docker containers.

```bash
docker compose --file docker-compose.yml up --detach
```

This modifies nodeA to have a second IP in the primary NIC, starts nginx, and verifies that it works.
```bash
bash node.customizations.txt
```

## Demonstrating networking

Ping all nodes from nodeA
```bash
for node in node{A,B,C,D} ; do
  echo == ${node}
  docker container exec nodeA ping -c 2 ${node}
  echo
done
```

Test webserver from nodeA
```bash
for node in node{A,B,C,D} ; do
  echo == ${node}
  2>&1 docker container exec nodeA curl -s -v -I ${node} | cat -n
  echo
done
```











## Interactive sessions within a container

```bash
docker container exec -it nodeA /bin/bash
```

