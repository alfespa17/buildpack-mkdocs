# Base Image

# Install CLI

Buildpack documentation links:

```bash
https://buildpacks.io/docs/
https://buildpacks.io/docs/tools/pack/#pack-cli
```

We need to define a custom stack for our base image and define the build and run image

Folder: buildpack-stack

Build both images:
```bash
cd  buildpack-stack
docker build . -t cnbs/applaudo-stack-build:focal --target build
docker build . -t cnbs/applaudo-stack-run:focal --target run
cd ..
```

# Create Builder

```bash
cd buildpack-builder
pack builder create mkdocs-builder:focal --config ./builder.toml
cd ..
```

Update the local configuration to use the new builder

```bash
pack config default-builder mkdocs-builder:focal
pack config trusted-builders add mkdocs-builder:focal
```

# Create Buildpack

Create base project to start working with buildpacks

```bash
cd mkdocs-buildpack
pack buildpack new applaudo/mkdocs --api 0.8 --path mkdocs-buildpack --version 0.0.1 --stacks io.buildpacks.applaudo.stacks.focal
```

# Use Buildpack
 
```bash
pack config trusted-builders add mkdocs-builder:focal
pack builder create mkdocs-builder:focal --config ./buildpack-builder/builder.toml
pack build my-app1 --builder mkdocs-builder:focal --path mkdocs-sample/ -v
docker run --rm -p 8080:8080 my-app1
```

# Examples pack 3 different images

```bash
pack build my-app1 --builder mkdocs-builder:focal --path mkdocs-sample/ -v
pack build my-app2 --builder mkdocs-builder:focal --path sphinx-sample/ -v
pack build my-app3 --builder mkdocs-builder:focal --path mkdocs-az/ -v

docker run --rm -p 8080:8080 my-app1
docker run --rm -p 8080:8080 my-app2
docker run --rm -p 8080:8080 my-app3
```

# Earthfile

Example to use earthly to build the image with mkdocs

docker build . -t earthfile-pack:focal