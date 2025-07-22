📘 README.md — Kubernetes Mini Project: My Web App
markdown
Copy
Edit
# 🚀 Kubernetes Mini Project: Deploying a Web App with ConfigMap, Secret & Service

This mini project demonstrates how to deploy a simple NGINX-based web application on a Kubernetes cluster using:

- ✅ Deployments
- ✅ Pods
- ✅ Services
- ✅ ConfigMaps & Secrets
- ✅ Namespaces
- ✅ Labels & Selectors
- ✅ Port Forwarding
- ✅ Rollout Updates
- ✅ Logs & Exec into Pod
- ✅ YAML-based resource management

---

## 🧱 Project Structure

```bash
k8s-mini-project/
├── configmap.yaml
├── secret.yaml
├── deployment.yaml
├── service.yaml
├── namespace.yaml
🌐 Prerequisites
Minikube or a running Kubernetes cluster

kubectl configured and working

(Optional) metrics-server for resource usage

📁 Step-by-Step Guide
1️⃣ Create a Namespace
yaml
Copy
Edit
# namespace.yaml
apiVersion: v1
kind: Namespace
metadata:
  name: myapp-namespace
bash
Copy
Edit
kubectl apply -f namespace.yaml
kubectl config set-context --current --namespace=myapp-namespace
2️⃣ Create a ConfigMap
yaml
Copy
Edit
# configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: myapp-config
data:
  welcome_message: "Welcome to MyApp running on Kubernetes!"
bash
Copy
Edit
kubectl apply -f configmap.yaml
3️⃣ Create a Secret
yaml
Copy
Edit
# secret.yaml
apiVersion: v1
kind: Secret
metadata:
  name: myapp-secret
type: Opaque
data:
  password: YWRtaW4xMjM=   # base64 of 'admin123'
bash
Copy
Edit
kubectl apply -f secret.yaml
4️⃣ Create the Deployment
yaml
Copy
Edit
# deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-deployment
  labels:
    app: myapp
spec:
  replicas: 2
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
        - name: myapp-container
          image: nginx
          ports:
            - containerPort: 80
          env:
            - name: WELCOME_MESSAGE
              valueFrom:
                configMapKeyRef:
                  name: myapp-config
                  key: welcome_message
            - name: ADMIN_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: myapp-secret
                  key: password
bash
Copy
Edit
kubectl apply -f deployment.yaml
5️⃣ Expose the App with a Service
yaml
Copy
Edit
# service.yaml
apiVersion: v1
kind: Service
metadata:
  name: myapp-service
spec:
  selector:
    app: myapp
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: ClusterIP
bash
Copy
Edit
kubectl apply -f service.yaml
🧪 Test and Interact with the App
✅ Get All Resources
bash
Copy
Edit
kubectl get all
✅ Check Logs
bash
Copy
Edit
kubectl logs <pod-name>
✅ Access Pod Shell
bash
Copy
Edit
kubectl exec -it <pod-name> -- /bin/bash
✅ Port Forward Service
bash
Copy
Edit
kubectl port-forward svc/myapp-service 8080:80
Then open: http://localhost:8080

🔁 Perform a Rollout Update
bash
Copy
Edit
kubectl set image deployment/myapp-deployment myapp-container=nginx:1.25
kubectl rollout status deployment/myapp-deployment
kubectl rollout history deployment/myapp-deployment
kubectl rollout undo deployment/myapp-deployment
🔧 Scale the Deployment
bash
Copy
Edit
kubectl scale deployment myapp-deployment --replicas=4
🏷 Labels and Selectors
bash
Copy
Edit
kubectl label pod <pod-name> env=prod
kubectl get pods --show-labels
kubectl get pods -l env=prod
📊 (Optional) View Resource Usage
Requires metrics-server.

bash
Copy
Edit
kubectl top pod
kubectl top node
🧹 Clean Up
bash
Copy
Edit
kubectl delete -f .
kubectl delete namespace myapp-namespace