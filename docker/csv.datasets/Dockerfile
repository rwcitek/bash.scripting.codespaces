FROM ubuntu:22.04

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y \
        csvkit \
        csvtool \
        curl \
        elinks \
        iputils-ping \
        jq \
        ;

WORKDIR /data

RUN curl -L -s -o titanic.csv 'https://ddc-datascience.s3.amazonaws.com/Projects/Example/Data/Titanic.train.csv'
RUN curl -L -s -o a-z.01-1k.tsv 'https://ddc-datascience.s3.amazonaws.com/a-z.business/2023-08-21/01.1k.txt'
RUN curl -L -s -o a-z.combined.tsv 'https://ddc-datascience.s3.amazonaws.com/a-z.business/2023-08-21/combined.txt'

CMD ["/bin/bash"]

COPY Dockerfile /
