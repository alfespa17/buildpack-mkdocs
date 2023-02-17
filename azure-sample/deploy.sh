#!/bin/bash

echo "Running deployment static file"
azcopy copy "/deployment/site" "$DEPLOYMENT_BLOB_SERVICE_URL\$web$SAS_TOKEN" --recursive=true --as-subdir=false