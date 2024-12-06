.PHONY : build

DOCKER_USERNAME ?= mokolo-org
APPLICATION_NAME ?= pip
TIMESTAMP ?= $(shell date +"%Y%m%d-%H%M%S")

build :
	docker build --file Dockerfile --tag ${DOCKER_USERNAME}/${APPLICATION_NAME}:latest .
	docker tag ${DOCKER_USERNAME}/${APPLICATION_NAME}:latest ${DOCKER_USERNAME}/${APPLICATION_NAME}:$(TIMESTAMP)
	sleep 2
	for tag in $(shell docker run --rm -i -t ${DOCKER_USERNAME}/${APPLICATION_NAME}:latest '/usr/local/bin/get-tags') ; do \
		docker tag ${DOCKER_USERNAME}/${APPLICATION_NAME}:latest ${DOCKER_USERNAME}/${APPLICATION_NAME}:$$tag ; \
	done

