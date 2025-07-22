## Docker networking-
---
Docker network drivers are used to manage how containers communicate with each other and with the outside world.

### Types of Docker Networks-
- Docker has several types of networks, each suited to different use cases. These network types are known as network drivers.

### 1- Bridge Network (default)
The bridge network driver is the default network driver in Docker. It creates a private internal network on the host where containers can communicate with each other.
- Use Case: This is the default network driver for Docker containers. Ideal for applications that run in containers on the same host and need to communicate with each other.
- Description:
  - When you start Docker, a default bridge network is created automatically.
  - When you run a container without specifying a network, Docker will connect it to a bridge network. This is a private, internal network on your host machine.

- How it works: Containers on the same bridge network can communicate with each other using their IP addresses. However, containers on different bridge networks or the host network cannot directly communicate unless exposed through port mappings.

- Accessing External Services: To allow external services to communicate with containers, you need to expose container ports to the host.

#### How to Create a Bridge Network-
```
docker network create -d bridge my-net
```
- it will create a bridge network name: my-net

#### inspect a Network-
```
docker network inspect my-net
```
- it will shows the all the ips assigned to the container's, dns and address space of the network.
#### how to cnnect a container to network-
```
docker network connect network_name container_name
```
- example-
```
docker network connect akkc ak_fire
docker network connect my-net ubuntu
```
#### Connect container to network & assign port at the time of its creation-
```
docker run -d --name container_name --network network_name --port host_port:container_port -it nginx
```
- example-
```
docker run -d --name nginx_ak --network akkc -p 8181:80 -it nginx
docker run -d --name firefox_ak --network akkc -p 9090:3000 -it linuxserver/firefox
```
### how to install Firefox container-
```
docker pull linuxserver/firefox
docker run -dit --network network_name -p 8888:3000 linuxserver/firefox
```
- default port for `linuxserver/firefox's` is:3000


### 2- Host Network-
- Use Case: The container shares the host's network stack and can When you want the container to share the host machine's networking namespace.
- Description: The container will share the host's network stack (access the same network interfaces as the host) and will not get its own IP address. Instead, it uses the host's IP and network interfaces. This is suitable when you need high network performance and don’t need network isolation.

- How it works: The container can directly access all the host's network interfaces and resources, but the container's network is tied to the host machine.
 Accessing External Services: External services can communicate directly with the container using the host's IP address and ports.

Example:
```
docker run -d --name container_name --network host my_image
```
### 3- Overlay Network-
- Use Case: Used in Docker Swarm or multi-host setups to allow containers running on different hosts to communicate.
- Description: The overlay network allows containers on different Docker hosts to communicate as if they were on the same local network. This is essential in a distributed system where you have multiple Docker hosts in a cluster.
- How it works: Docker creates a virtual network that spans across multiple Docker hosts, making container communication across hosts possible. This is commonly used with Docker Swarm or Kubernetes for multi-host container orchestration.
- Accessing External Services: To allow access to containers externally, you can map ports to the host machine.

Example:
```
docker network create --driver overlay my_overlay_network
```

### 4- Macvlan Network-
- Use Case: When you want containers to appear as full-fledged devices on your network with their own MAC addresses.
- Description: The macvlan network driver allows containers to have their own MAC address and appear as separate devices on the network. This is useful if you need the container to behave like a physical machine on the network.
- How it works: Containers get their own IP addresses within the host’s network and can communicate directly with other devices on the physical network. However, containers can’t directly communicate with the Docker host itself.
- Accessing External Services: Containers can access external services using the host network and IP addresses.

Example:
```
docker network create -d macvlan \
  --subnet=192.168.1.0/24 --gateway=192.168.1.1 \
  -o parent=eth0 my_macvlan_network
```
### 5- None Network-
- Use Case: Useful for containers that do not need network connectivity or when you want to manually configure the container's network.
- Description: Isolates a container from the host's network and other containers. The container has no network interfaces apart from the loopback interface. The container will have no network interfaces and no access to the network. You can manually configure networking or use other means to access the container.
- How it works: This is typically used in cases where you want to isolate the container completely, or you are managing networking in other ways.
- Accessing External Services: There is no direct external communication with the container unless manually configured.

Example:
```
docker run -d --name container_name --network none my_image
```
### Key Concepts in Docker Networking-
---
#### Network Bridge:
- Each container gets an internal IP address on the bridge network. These containers can communicate with each other by IP, but to communicate with the outside world, you must expose ports.

#### Port Mapping:
- Docker allows you to map container ports to host machine ports, making the services inside containers accessible externally.
- Example: docker run -p 8080:80 my_image will map port 80 inside the container to port 8080 on the host.

#### DNS Resolution:
- Docker containers on the same network can resolve each other’s names using DNS, and you can access a container by its name rather than its IP address.
- Example: A container named web can be accessed from another container on the same network using web:80.
Container Communication:

#### Same Network: 
- Containers on the same Docker network can communicate directly with each other by container name or IP.
- Different Networks: Containers on different networks cannot communicate unless you connect the networks or expose ports.
#### Docker Compose and Networking:
- When using Docker Compose, all containers defined in a docker-compose.yml file are by default placed on the same network, allowing them to communicate by their container names.
-You can also define custom networks in Compose files.

