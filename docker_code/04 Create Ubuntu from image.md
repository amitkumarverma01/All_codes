## Install the ubuntu using docker-

### Pull the Image-
```
Docker pull ubuntu
```

### run the ubuntu container-
```
docker run -dit  ubuntu
```
### you can also used this-
```
docker run -d --name akkc1 -it ubuntu
docker run -it --name akk1 ubuntu 
```
### Create multiple container-
```
for ($i = 1; $i -le 50; $i++) {
    docker run -d --name "BBPL_$i" -it ubuntu
}
```
### Kill multiple container-
- it wiil stop/kill all the running container-
```
docker kill (docker ps -q)
```

### Remove/Delete multiple container-
- it will delete all stoped container-
```
docker rm (docker ps -a -q)
```
