### Create a Dockerfile-

### what is Dockerfile ?
- A Dockerfile is a text file containing instructions for building a container image.

- The Dockerfile supports the following instructions:

- `Instruction` :  `Description`
- `ADD` : Add local or remote files and directories.
- `ARG` :	Use build-time variables.
- `CMD` : Specify default commands.
- `COPY` :  Copy files and directories.
- `ENTRYPOINT` :  Specify default executable.
- `ENV` :  Set environment variables.
- `EXPOSE` :  Describe which ports your application is listening on.
- `FROM` :  Create a new build stage from a base image.
- `HEALTHCHECK` :  Check a container's health on startup.
- `LABEL` :  Add metadata to an image.
- `MAINTAINER` :  Specify the author of an image.
- `ONBUILD` :  	Specify instructions for when the image is used in a build.
- `RUN` :  Execute build commands.
- `SHELL` :  Set the default shell of an image.
- `STOPSIGNAL` :  Specify the system call signal for exiting a container.
- `USER` :  Set user and group ID.
- `VOLUME` :  Create volume mounts.
- `WORKDIR` :  Change working directory.


### dockerfile for ubuntu-
```
# syntax=docker/dockerfile:1
FROM ubuntu:latest

LABEL maintainer="akkc <akkc@gmail.com>"

# install app dependencies
RUN apt update && apt install net-tools

RUN apt install -y iputils-ping

SHELL ["/bin/bash"]

VOLUME ["/Akkc_data"]

ENTRYPOINT ["/bin/bash"]
```
