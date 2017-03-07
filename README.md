# Redis as Stateful Set With Sentinel

Kubernetes Version: **1.5.2**

Redis Version: **3.2**

## Building the Docker image (not required)

    docker build -t <tagname> .

## Setting up dynamic volume provisioning

    kubectl create -f storage.yml

## Running the cluster

    kubectl create -f primary.yml -f secondary.yml -f sentinel.yml
