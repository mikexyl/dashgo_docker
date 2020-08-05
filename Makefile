.PHONY: build run run-root

XAUTH:=/tmp/.docker.xauth

build:
	docker build --build-arg myuser=${shell whoami} -t dashgo .

#not work now
run-root: build
	docker run -it --rm \
	   --privileged \
	   --env="DISPLAY=$DISPLAY" \
	   --env="QT_X11_NO_MITSHM=1" \
	   --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	   --env="XAUTHORITY=$XAUTH" \
	   --volume="$XAUTH:$XAUTH" \
	   --runtime=nvidia \
	   maplab

run:
	make build
	touch $(XAUTH)
	xauth nlist ${DISPLAY} | sed -e 's/^..../ffff/' | xauth -f $(XAUTH) nmerge - 
	docker run -it --name dashgo  --rm \
	   --privileged \
	   --env="DISPLAY=$DISPLAY" \
	   --env="QT_X11_NO_MITSHM=1" \
	   --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	   -e XAUTHORITY=$(XAUTH) \
	   --volume="$(XAUTH):$(XAUTH)" \
	   --runtime=nvidia \
	   -e HOME=${HOME} \
	   -v "${HOME}:${HOME}/" \
	   -u $(shell id -u ${USER} ):$(shell id -g ${USER}) \
	   -v /etc/group:/etc/group:ro \
	   -v /etc/localtime:/etc/localtime \
	   -v /etc/passwd:/etc/passwd:ro \
	   --security-opt seccomp=unconfined \
	   --net=host \
	   --privileged \
	   dashgo

attach:
	docker exec -it dashgo /bin/bash
