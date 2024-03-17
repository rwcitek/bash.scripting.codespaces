# Based on https://docs.streamlit.io/knowledge-base/tutorials/deploy/docker

FROM python:3.9-slim

WORKDIR /app

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
      build-essential \
      curl \
      git \
      software-properties-common \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 https://github.com/streamlit/streamlit-example.git .

RUN pip3 install -r requirements.txt

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

CMD ["streamlit", "run", "streamlit_app.py", "--server.port=8501", "--server.address=0.0.0.0"]

COPY Dockerfile /



# Build image
# docker image build --tag streamlit-example ./.

# Run instance
# docker run --rm --publish 127.0.0.1:8501:8501 streamlit-example


