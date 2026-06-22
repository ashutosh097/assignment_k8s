# Employees API - DevOps/Kubernetes Assignment

## Overview

Employees API is a containerized Express.js application backed by MySQL and deployed on Kubernetes using Helm. The solution includes auto-scaling, persistent storage, rolling updates, configuration management, and external access through NGINX Ingress.

## Features

* Express.js REST API
* MySQL database
* Docker containerization
* Kubernetes deployment using Helm
* Horizontal Pod Autoscaler (4–10 replicas)
* Rolling updates with zero downtime
* NGINX Ingress
* ConfigMaps and Secrets
* Persistent storage using PVC

---

## Architecture

```text
Internet
   |
Ingress
   |
employee-api Service
   |
Deployment (4-10 Pods)
   |
MySQL Service
   |
MySQL StatefulSet
   |
Persistent Volume (10Gi)
```

---

## Quick Start

### Build Docker Image

```bash
docker build -t employees-api:1.0 .
```

### Deploy to Kubernetes

```bash
helm install employee-app .
kubectl get all
```

---

## API Endpoints

### Get Employees

```http
GET /employees
```

### Health Check

```http
GET /health
```

### External Access

```text
http://35.231.79.130/employees
http://35.231.79.130/health
```

---

## Kubernetes Components

| Resource    | Purpose                   |
| ----------- | ------------------------- |
| Deployment  | Runs API pods             |
| StatefulSet | Runs MySQL                |
| Service     | Internal networking       |
| Ingress     | External access           |
| ConfigMap   | Application configuration |
| Secret      | Database credentials      |
| PVC         | Persistent storage        |
| HPA         | Automatic scaling         |

---

## Configuration

```yaml
api:
  replicas: 4

hpa:
  minReplicas: 4
  maxReplicas: 10
  cpuUtilization: 70

mysql:
  storage: 10Gi
```

---

## Rolling Update Strategy

```yaml
strategy:
  type: RollingUpdate
  rollingUpdate:
    maxSurge: 1
    maxUnavailable: 0
```

This configuration ensures zero-downtime deployments.

---

## Environment Variables

| Variable    | Description      |
| ----------- | ---------------- |
| PORT        | Application port |
| DB_HOST     | MySQL hostname   |
| DB_PORT     | MySQL port       |
| DB_USER     | MySQL username   |
| DB_PASSWORD | MySQL password   |
| DB_NAME     | Database name    |

---

## Database

### Table: employees

Contains employee information including:

* Employee ID
* Name
* Email
* Department
* Role
* Project Details
* Feedback
* Reporting Manager

Sample dataset contains 12 employee records.

---

## Common Commands

### View Pods

```bash
kubectl get pods
```

### View HPA

```bash
kubectl get hpa
```

### View Logs

```bash
kubectl logs deployment/employee-api
```

### Upgrade Release

```bash
helm upgrade employee-app .
```

### Rollback Deployment

```bash
kubectl rollout undo deployment/employee-api
```

---

## Troubleshooting

### Check Pod Details

```bash
kubectl describe pod <pod-name>
```

### Check Logs

```bash
kubectl logs <pod-name>
```

### Check MySQL

```bash
kubectl exec -it mysql-0 -- mysql -u root -p
```

### Check HPA

```bash
kubectl get hpa
```

---

## Technology Stack

* Node.js
* Express.js
* MySQL
* Docker
* Kubernetes
* Helm
* NGINX Ingress
* Horizontal Pod Autoscaler (HPA)

---

## Notes

* Metrics Server is required for HPA.
* MySQL data is stored on a Persistent Volume (10Gi).
* Secrets are used for sensitive credentials.
* ConfigMaps are used for application configuration.
* Rolling updates provide zero-downtime deployments.
