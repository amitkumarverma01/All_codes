### What is DockerHub?
Docker Hub is a cloud-based registry service provided by Docker that allows you to store, share, and manage Docker container images. 

### Docker push-
- The docker push command is used to upload a Docker image to a registry, such as Docker Hub or a private registry.
- Before pushing an image, you need to log in to the registry using the `docker login` command.
```
docker login
```
- Tag the Image: Ensure your image is tagged correctly with the registry's hostname and the repository name.
```
docker tag myimage:latest registry-host:5000/myname/myimage:latest

docker tag akkc amitkkc01/ubuntu:v1
```
- Push the Image: Use the `docker push` command to upload the image to the registry.
```
docker push registry-host:5000/myname/myimage:latest

docker push amitkkc01/ubuntu:v1
```



