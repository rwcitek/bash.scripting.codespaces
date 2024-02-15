#!/bin/bash

docker container run \
  --rm \
  --detach \
  --volume ${PWD}:/data/ \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --workdir /data/ \
  --publish 127.0.0.1:8888:8888 \
  --name jupyter \
  rwcitek/jupyter.light \
    jupyter lab --allow-root --ip=0.0.0.0 --NotebookApp.token=''

sleep 1
{ cat <<'eof'
apt-get update

apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg |
gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" |
  tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update

# Here is the part that is different
apt-get install -y docker-ce-cli
eof
} | docker container exec -i jupyter /bin/bash

