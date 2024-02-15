#!/bin/bash

docker container run \
  --rm \
  --detach \
  --volume ${PWD}:/data/ \
  --workdir /data/ \
  --publish 127.0.0.1:8888:8888 \
  --name jupyter \
  rwcitek/jupyter.light \
    jupyter lab --allow-root --ip=0.0.0.0 --NotebookApp.token=''

