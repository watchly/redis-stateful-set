#!/bin/bash

VERSION=`date -u +'%Y%m%d-%H%M'`

echo "Building & pushing 'debug' version ${VERSION}"

docker build -t gcr.io/watchly-service/debug:${VERSION} .

gcloud docker push gcr.io/watchly-service/debug:${VERSION}

echo "Updating debug service"

kubectl patch statefulset debug --type='json' -p="[{\"op\": \"replace\", \"path\": \"/spec/template/spec/containers/0/image\", \"value\":\"gcr.io/watchly-service/debug:${VERSION}\"}]"

kubectl delete pod debug-0

echo "Update 'debug' pod should be available in a few minutes"
