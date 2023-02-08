# Base Image

We need to define a custom stack for our base image and define the build and run image

Folder: buildpack-stack

Build both images:
```bash
cd  buildpack-stack
docker build . -t cnbs/applaudo-stack-build:focal --target build
docker build . -t cnbs/applaudo-stack-run:focal --target run
```
# Create Builder

```bash
cd buildpack-builder
pack builder create mkdocs-builder:focal --config ./builder.toml
```

Testing:
```bash
 pack build mkdocs-app --path ./mkdocs-sample --buildpack ./buildpack-builder/buildpack/mkdocs-buildpack/
```

# Create Buildpack

Create base project to start working

```bash
cd mkdocs-buildpack
pack buildpack new applaudo/mkdocs --api 0.8 --path mkdocs-buildpack --version 0.0.1 --stacks io.buildpacks.applaudo.stacks.focal
```

# Use Buildpack
 
```bash
pack config trusted-builders add mkdocs-builder:focal
pack build mkdocs-app --path ./mkdocs-sample --builder mkdocs-builder:focal
```