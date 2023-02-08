# Base Image

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
```

Update the require files

```bash
pack config default-builder mkdocs-builder:focal
pack config trusted-builders add mkdocs-builder:focal
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
pack builder create mkdocs-builder:focal --config ./buildpack-builder/builder.toml
pack build my-app --builder mkdocs-builder:focal --path mkdocs-sample/ -v
```