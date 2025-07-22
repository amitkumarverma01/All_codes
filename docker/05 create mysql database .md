## Create mysql database-

### pull the docker image of mysql-
```
docker pull mysql:latest
```
### Run MySQL Container
- Now, run the MySQL container and map port 3306 from the container to port 3306 on your host machine. You’ll also want to set an environment variable for the MySQL root password.
```
docker run --name mysql1 -e MYSQL_ROOT_PASSWORD=admin@123 -p 3306:3306 -d mysql:latest
```
- command details-
- `--name mysql-container`: This gives your container a name, so you can easily reference it.
- `-e MYSQL_ROOT_PASSWORD=my-secret-pw`: This sets the MySQL root password to my-secret-pw. You can change this password to whatever you like.
 - `-p 3306:3306`: This maps port 3306 of the container to port 3306 on your host. This is the default port for MySQL.
 -  `-d`: This runs the container in the background (detached mode).
- mysql:latest: This is the image you’re using, which is the latest version of MySQL.
  
### now check the container-
```
docker ps
```
### Run the Command: you can use the following to access its bash shell:
```
docker exec -it ak_sql bash
```
### connect to a MySQL database server from the command line using the mysql client-
```
 mysql -u root -p
```
### To stop the container:
```
docker rm mysql-container
```
### To remove the container (if needed):
```
docker rm mysql-container
```
