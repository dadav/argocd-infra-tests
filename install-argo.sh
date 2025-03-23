#!/bin/bash

if ! >/dev/null 2>&1 kubectl get namespace argocd; then
	kubectl create namespace argocd
fi

kubectl -n argocd create -f https://raw.githubusercontent.com/argoproj/argo-cd/refs/heads/master/manifests/install.yaml

kubectl -n argocd wait --for=create secret argocd-initial-admin-secret --timeout=5m

echo "Starting port-forward"
>/dev/null 2>&1 kubectl -n argocd port-forward svc/argocd-server 8080:80 &
echo "#####################################"
echo "#####################################"
echo "#####################################"
echo "URL: https://localhost:8080"
echo "Username: admin"
echo "Password: $(kubectl get -n argocd secrets argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)"
