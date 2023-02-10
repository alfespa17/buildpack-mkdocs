VERSION 0.6
FROM ubuntu:focal
WORKDIR /docs-workdir

build:
   RUN apt-get update && apt-get install -y git wget jq python3 python3-pip && rm -rf /var/lib/apt/lists/*
   RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir mkdocs
   COPY mkdocs-sample/docs ./docs
   COPY mkdocs-sample/mkdocs.yml
   RUN mkdocs build

