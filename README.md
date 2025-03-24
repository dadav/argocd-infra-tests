# Example for a multi-cluster management repo structure

## Setup

```bash
# Create a kind cluster
./create-kind-cluster.sh

# Install argocd
./install-argo.sh

# Create initial appset
kubectl -n argocd create -f ./configs/clusters/local/appset.yaml
```
