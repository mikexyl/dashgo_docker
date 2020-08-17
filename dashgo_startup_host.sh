#!/usr/bin/env bash
DOCKER_NAME=dashgo
docker run -it --name ${DOCKER_NAME}  --rm \
   --privileged \
   -e HOME=${HOME} \
   -v "${HOME}/Workspace:${HOME}/Workspace/" \
   -v /etc/group:/etc/group:ro \
   -v /etc/localtime:/etc/localtime \
   -v /etc/passwd:/etc/passwd:ro \
   --security-opt seccomp=unconfined \
   --net=host \
   --privileged \
   ${DOCKER_NAME} \
   ./dashgo_startup.sh
