
FROM ubuntu:22.04 as data

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y curl

WORKDIR /data

RUN curl -L -s -o titanic.csv 'https://ddc-datascience.s3.amazonaws.com/Projects/Example/Data/Titanic.train.csv'
RUN curl -L -s -o a-z.01-1k.tsv 'https://ddc-datascience.s3.amazonaws.com/a-z.business/2023-08-21/01.1k.txt'
RUN curl -L -s -o a-z.combined.tsv 'https://ddc-datascience.s3.amazonaws.com/a-z.business/2023-08-21/combined.txt'

FROM scratch

COPY --from=data /data /data

COPY Dockerfile /

# Build image
# docker image build --tag csv_datasets ./.

# Create volume
# docker container create --volume data:/data csv_datasets : | xargs docker container rm

