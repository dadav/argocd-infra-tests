#!/bin/bash

kubectl create -f https://raw.githubusercontent.com/argoproj/argo-cd/refs/heads/master/manifests/install.yaml

kubectl wait --for=create secret argocd-initial-admin-secret --timeout=5m

echo "Password: $(kubectl get secrets argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)"
