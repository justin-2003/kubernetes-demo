set -e

SET NAME=kubernetes-demo-api
SET USERNAME=justinsam03
SET IMAGE=%USERNAME%/%NAME%:latest

ECHO Building Docker image...
docker build -t %IMAGE% .

ECHO Pushing image to DockerHub...
docker push %IMAGE%

ECHO Applying Kubernetes manifests...
kubectl apply -f k8s\deployment.yaml
kubectl apply -f k8s\service.yaml

ECHO Getting pods...
kubectl get pods

ECHO Getting services..
kubectl get services

ECHO fetching the main services..."
kubectl get services %NAME%-service