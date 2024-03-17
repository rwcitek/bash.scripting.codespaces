# Kubernetes

## Intro

Exploring kubernetes on CodeSpaces.

## Getting started

https://minikube.sigs.k8s.io/docs/start/

```bash
(
  cd /tmp
  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
  sudo dpkg -i minikube_latest_amd64.deb
)

minikube 
docker 

docker container list -a
docker image list -a

minikube start

kubectl cluster-info 
kubectl get node
kubectl get namespaces 
kubectl get pods -A
kubectl get services -A
```



