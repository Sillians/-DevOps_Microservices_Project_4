#!/usr/bin/env bash

dockerpath="sillians/flasksklearndemo"

# Run in Docker Hub container with kubernetes
kubectl run flasksklearndemo\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=80 --labels app=flaskskearlndemo

# List kubernetes pods
kubectl get pods

# Forward the container port to host
kubectl port-forward flaskskearlndemo 8000:80

# Horizontal port autoscaler
# kubectl scale {deployment name} --replicas={desired number of replicas}
# newNumPods = ceil(currentNumPods * (currentMetric / desiredMetric))