VERSION 0.6
FROM earthly/dind:ubuntu
WORKDIR /docs-workdir

deps:
   RUN apt update && apt install -y software-properties-common
   RUN add-apt-repository ppa:cncf-buildpacks/pack-cli && apt-get update && apt-get install -y pack-cli
   RUN pack builder suggest 
   COPY buildpack-builder ./buildpack-builder
   RUN ls
   RUN pack builder create mkdocs-builder:focal --config ./buildpack-builder/builder.toml

build:
   FROM earthly/dind:ubuntu
   WITH DOCKER --load test:latest=+deps
        RUN pack builder suggest
   END
