#!/bin/bash

if ! >/dev/null grep kind <<<"$(kind get clusters)"; then
	kind create cluster --config=kind-config.yaml
else
	echo "cluster already created."
fi

echo "Setting context"
kubectl cluster-info --context kind-kind
