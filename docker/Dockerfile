FROM ubuntu:22.04

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y iputils-ping curl elinks csvtool elinks csvkit

RUN curl -L -s -o titanic.csv 'https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv'

CMD ["/bin/bash"]
COPY Dockerfile /
