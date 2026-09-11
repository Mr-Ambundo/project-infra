# Project 2: Infra Queue B

A containerized static site deployed to Kubernetes, demonstrating infrastructure-as-code and container orchestration skills.

## Tech Stack

- **Docker** — Containerization
- **Kubernetes (Minikube)** — Container orchestration
- **Terraform** — Infrastructure-as-Code (GCP config)
- **Nginx** — Web server

##  Architecture

        ┌─────────────────┐
        │ Browser │
        └────────┬────────┘
        │
        ▼
        ┌─────────────────┐
        │ NodePort:30080 │
        └────────┬────────┘
        │
        ▼
        ┌─────────────────┐
        │ K8s Service │
        └────────┬────────┘
        │
        ┌────┴────┐
        ▼ ▼
        ┌───────┐ ┌───────┐
        │ Pod 1 │ │ Pod 2 │
        └───────┘ └───────┘

##  How to Run Locally

### 1. Build the Docker image

docker build -t project2-infra .

### 2. Start MiniKube

minikube start --driver=docker .

### 3. Load the image into Minikube 

minikube image load project2-infra:latest .

### 4. Deploy to Kubernetes 

kubectl apply -f deployment.yaml .
kubectl apply -f service.yaml .

### 5. Access the app
minikube service project2-infra-service --url .

## project-structure
project2-Infra/
├── Dockerfile
├── index.html
├── deployment.yaml
├── service.yaml
├── providers.tf
├── gce.tf
└── README.md