# 1. Set a common base
FROM ubuntu:focal as base

# 2. Set required CNB information
ENV CNB_USER_ID=1000
ENV CNB_GROUP_ID=1000
ENV CNB_STACK_ID="io.buildpacks.applaudo.stacks.focal"
LABEL io.buildpacks.stack.id="io.buildpacks.applaudo.stacks.focal"

# 3. Create the user
RUN groupadd cnb --gid ${CNB_GROUP_ID} && \
  useradd --uid ${CNB_USER_ID} --gid ${CNB_GROUP_ID} -m -s /bin/bash cnb

# 4. Install common packages
RUN apt update && \
  apt install -y xz-utils ca-certificates && \
  rm -rf /var/lib/apt/lists/*

# 5. Start a new run stage
FROM base as run

# Install custom packages for run image
RUN apt-get update && \
  apt-get install -y git wget jq python3 python3-pip && \
  rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir mkdocs

# 6. Set user and group (as declared in base image)
USER ${CNB_USER_ID}:${CNB_GROUP_ID}

# 7. Start a new build stage
FROM base as build

# 8. Install packages that we want to make available at build time
RUN apt-get update && \
  apt-get install -y git wget jq python3 python3-pip && \
  rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir mkdocs

# ========== ADDED ===========
# 9. Set user and group (as declared in base image)
USER ${CNB_USER_ID}:${CNB_GROUP_ID}