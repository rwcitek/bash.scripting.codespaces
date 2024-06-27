# Use an Ubuntu as a parent image
FROM ubuntu:22.04

# Set the shell
SHELL ["/bin/bash", "-c"]

# Set the working directory in the container
WORKDIR /app

# Install necessary dependencies
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y \
      curl \
      gnupg \
      jq \
      less \
      python3-pip \
      tree \
      unzip \
      vim \
      wget \
    && rm -rf /var/lib/apt/lists/*

# Download the latest ChromeDriver and Chrome browser
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list && \
    apt-get -y update && \
    apt-get -y install google-chrome-stable 

# see:
# - https://github.com/GoogleChromeLabs/chrome-for-testing?tab=readme-ov-file#json-api-endpoints
# - https://googlechromelabs.github.io/chrome-for-testing/known-good-versions-with-downloads.json

RUN CHROME_VERSION="$( google-chrome --product-version )" && \
    wget -q --continue -P /tmp/ "https://storage.googleapis.com/chrome-for-testing-public/${CHROME_VERSION}/linux64/chromedriver-linux64.zip" && \
    unzip -q /tmp/chromedriver*.zip -d /usr/local/bin && \
    rm /tmp/chromedriver*.zip

# Install Selenium
RUN pip install selenium

COPY Dockerfile /

## docker image build -t rwcitek/my_selenium_container ./.
## docker image tag rwcitek/my_selenium_container my_selenium_container
## docker run --rm -i -v $PWD:/app my_selenium_container python3 script.py

