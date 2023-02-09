VERSION 0.6
FROM ubuntu:focal
WORKDIR /docs-workdir

deps:
   RUN apt update && apt install -y software-properties-common
   RUN add-apt-repository ppa:cncf-buildpacks/pack-cli && apt-get update && apt-get install -y pack-cli
   ENTRYPOINT [ "/bin/bash"]
   SAVE IMAGE earthfile-pack:focal

build:
   WITH DOCKER --load test:latest=+deps
        RUN pack builder suggest
   END
