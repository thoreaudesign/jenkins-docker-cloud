DOCKER_REPO 	:= thoreaudesign
LATEST_TAG 	:= $(DOCKER_REPO)/$(IMAGE_NAME):latest

SLAVE_DIR	:= slaves
PROXY_DIR	:= docker-proxy

DOCKER_PROXY	:= jenkins-docker-proxy
ALPINE_PHP56	:= jenkins-slave-alpine-php56
CENTOS7_PHP56	:= jenkins-slave-centos7-php56
CENTOS7_PHP73	:= jenkins-slave-centos7-php73

LATEST		:= latest

default: all

proxy: 
	@echo "--- Building $(DOCKER_PROXY)..."
	docker build -t $(DOCKER_REPO)/$(DOCKER_PROXY):$(LATEST) -f $(PROXY_DIR)/Dockerfile .
	@echo "--- Complete: $(DOCKER_PROXY)."
proxy-push: 
	@echo ""
	@echo "--- Pushing image to docker registry '$(DOCKER_REPO)'."
	@docker push $(DOCKER_REPO)/$(DOCKER_PROXY):$(LATEST)
	@echo ""
alpine-php56:
	@echo "--- Building $(ALPINE_PHP56):$(LATEST)..."
	docker build -t $(DOCKER_REPO)/$(ALPINE_PHP56) -f $(SLAVE_DIR)/alpine-php56/Dockerfile .
	@echo "--- Complete: $(ALPINE_PHP56):$(LATEST)."
alpine-php56-push:
	@echo ""
	@echo "--- Pushing image to docker registry '$(DOCKER_REPO)'."
	@docker push $(DOCKER_REPO)/$(ALPINE_PHP56):$(LATEST)
	@echo ""
centos7-php56:
	@echo "--- Building $(CENTOS_PHP56):$(LATEST)..."
	docker build -t $(DOCKER_REPO)/$(CENTOS7_PHP56):$(LATEST) -f $(SLAVE_DIR)/centos7-php56/Dockerfile .
	@echo "--- Complete: $(CENTOS_PHP56):$(LATEST)."
centos7-php56-push:
	@echo ""
	@echo "--- Pushing image to docker registry '$(DOCKER_REPO)'."
	@docker push $(DOCKER_REPO)/$(CENTOS7_PHP56):$(LATEST)
	@echo ""
centos7-php73:
	@echo "--- Building $(CENTOS7_PHP73):$(LATEST)..."
	docker build -t $(DOCKER_REPO)/$(CENTOS7_PHP73):$(LATEST) -f $(SLAVE_DIR)/centos7-php73/Dockerfile .
	@echo "--- Complete: $(CENTOS7_PHP73):$(LATEST)."
centos7-php73-push:
	@echo ""
	@echo "--- Pushing image to docker registry '$(DOCKER_REPO)'."
	@docker push $(DOCKER_REPO)/$(CENTOS7_PHP73):$(LATEST)
	@echo ""

all: proxy proxy-push \
    alpine-php56 alpine-php56-push \
    centos7-php56 centos7-php56-push \
    centos7-php73 centos7-php73-push
