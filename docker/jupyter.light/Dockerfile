FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
      bsdmainutils \
      curl \
      elinks \
      file \
      iputils-ping \
      jq \
      python3-pip \
      tree \
      vim \
      ;

RUN pip install \
      bash_kernel \
      jupyterlab \
      pandas \
      pyarrow \
      && pip cache purge \
      ;

RUN python3 -m bash_kernel.install

RUN ln -snf bash /bin/sh

COPY Dockerfile /



# Remove existing image, if exists
# docker image rm rwcitek/jupyter.light

# Build a new image
# docker image build --tag rwcitek/jupyter.light ./.

# Push to Docker Hub
# docker image push rwcitek/jupyter.light
