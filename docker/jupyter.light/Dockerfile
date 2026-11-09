FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
      bsdmainutils \
      curl \
      elinks \
      file \
      git \
      iputils-ping \
      jq \
      python3-pip \
      tree \
      vim \
      ;

RUN pip install --break-system-packages \
      bash_kernel \
      duckdb \
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
