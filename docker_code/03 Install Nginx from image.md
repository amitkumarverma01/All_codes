## Install the nginx using docker-
### Search the image from dockr hub using-
- Docker search <image_name>
``` 
Docker search nginx
```
- choose the 1st image of nginx.
### Pull the Image from docker hub to local PC using-
- Docker pull <image_name>.
``` 
Docker pull nginx
```
### Run the nginx-
``` 
 docker run nginx
```
- run nginx in detached mode-
``` 
 docker run -d nginx
```
### Rename the name of nginx instance-

``` 
docker run -d --name akkc nginx
```
- replace the name akkc as your need.

### Port Mapping-
``` 
docker run -p akkc 9090:80 nginx
docker run -d --name akkc -p 8080:80 nginx   
```

### Run the nginx-
``` 
 docker exec akkc_container ls
 docker exec -i -t container bash
 docker exec -it akkc2 bash
```
- change the nginx `index.html` file content-
``` 
  echo "Welcome akkc2" > /usr/share/nginx/html/index.html
```
## To Run the 50 instances of nginx-
- run this command using Power Shell 7.x.x OR from Bash-
``` 
for ($i = 1; $i -le 50; $i++) {
    docker run -d --name "nginx_instance_$i" nginx
}
```
