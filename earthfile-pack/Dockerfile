# 1. Set a common base
FROM ubuntu:focal as base
 
RUN apt update && apt install -y software-properties-common

RUN add-apt-repository ppa:cncf-buildpacks/pack-cli && apt-get update && apt-get install -y pack-cli

