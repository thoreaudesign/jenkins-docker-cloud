default: all

build: 
	@docker build -d -it thoreaudesign/docker-proxy -f docker-proxy/Dockerfile 

all: build
