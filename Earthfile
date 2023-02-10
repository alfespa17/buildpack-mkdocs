VERSION 0.6
FROM ubuntu:focal
WORKDIR /docs-workdir

build:
   RUN apt-get update && apt-get install -y git wget jq python3 python3-pip && rm -rf /var/lib/apt/lists/*
   RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir mkdocs
   
   RUN mkdir /server/
   RUN cd /server
   WORKDIR /server
   COPY mkdocs-sample/docs ./docs
   COPY mkdocs-sample/mkdocs.yml ./mkdocs.yml
   RUN mkdocs build
   ENTRYPOINT ["mkdocs", "serve", "-a", "0.0.0.0:8080"]
   SAVE IMAGE my-docs:latest



