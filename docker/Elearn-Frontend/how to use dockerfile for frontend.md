## Follow these steps-
### **step-1 install git**

- **git** should be installed in your desktop.
- then clone the frontend repo using
```sh
git clone https://github.com/devopsinsiders/elearn-frontend.git
cd elearn-frontend
```

**Note**: Create Dockerfile inside the clone folder.

### **step-2 create the dockerfile**

**note**: dockerfile neme should be `Dockerfile`
- configuration of dockerfile-

```sh

FROM node

# Set working directory inside container
WORKDIR /akkc

# Copy application files to the container
COPY . .

# Install dependencies and build the application
RUN npm install
RUN npm run build

# Install Nginx
RUN apt update && apt install -y nginx

# Copy the build files to Nginx's default web directory
# Use /var/www/html because the default Nginx web directory is /var/www/html
RUN cp -r build/* /var/www/html

# Expose port 80 (container-side port)
EXPOSE 80

# Start Nginx in the foreground to serve the static files
CMD ["nginx", "-g", "daemon off;"]

```
### **step- 3 build the image**
build the image using-
```sh
docker build -t elearn_front:v1 .
```

### **step- 4 create container using the image**
```sh
docker run -dit --name elearn -p 8888:80 elearn_front:v1
```
### **step- 5 test on localhost**
open your browser type in addressbar-
```sh
localhost:8888
```


