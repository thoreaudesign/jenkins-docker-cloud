#Makefile for mw-import
#PROJECT_NAME := $(shell basename `git rev-parse --show-toplevel`)

#VERSION := $(shell git describe --always)


default: build

build: 
	@echo --- Building image $(LATEST_TAG).
	@docker build -t $(LATEST_TAG) .
	@echo --- Build complete.
	@echo ""

push:
	@echo ""
	@echo "--- Pushing image to docker registry '$(DOCKER_REPO)'."
	@docker push $(LATEST_TAG)
	@echo ""

all: build push
