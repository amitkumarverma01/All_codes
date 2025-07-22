 ### Docker commit command-
- useful to commit a container's file changes or settings into a new image.

```
docker commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]
```
- example-
```
docker commit my_ubuntu  akkc:version1
docker commit -a "Author Name" -m "Added new features" <container_id> <new_image_name>
```
-Options of Docker Commit

- `-a, --author`  Specifies the author name for the image
- `-c, --change`	  Applies Dockerfile instructions to the image
- `-m, --message`	  Specifies a commit message for the image
- `--pause`	  Pauses the container during commit
- `-p, --pause-file`	  Pauses the container using a pause file during commit
- `--platform`	  Sets the platform if not specified in the Dockerfile


## Docker Build command-
- docker `build` command is used to create a custom Docker image.
- It reads a Dockerfile located in your computer.
- use dot(.) for current dirrectory.
```
docker build -t <image_name> <path>
```
- for default path-
```
docker build -t <image_name> .(dot)
```
