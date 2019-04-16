default: all

jenkins-docker-proxy: 
	@echo "--- Building jenkins-docker-proxy..."
	docker build -t thoreaudesign/jenkins-docker-proxy -f jenkins-docker-proxy/Dockerfile .
	@echo "--- Complete: jenkins-docker-proxy."

slave-alpine-php56:
	@echo "--- Building jenkins-slave-alpine-php56..."
	docker build -t thoreaudesign/jenkins-slave-alpine-php56 -f jenkins-docker-slave/alpine-php56/Dockerfile .
	@echo "--- Complete: jenkins-slave-alpine-php56."

slave-centos7-php56:
	@echo "--- Building jenkins-slave-centos7-php56..."
	docker build -t thoreaudesign/jenkins-slave-centos7-php56 -f jenkins-docker-slave/centos7-php56/Dockerfile .
	@echo "--- Complete: jenkins-slave-centos7-php56."

all: jenkins-docker-proxy
