default: all

proxy: 
	@echo "--- Building jenkins-docker-proxy..."
	docker build -t thoreaudesign/jenkins-docker-proxy -f jenkins-docker-proxy/Dockerfile .
	@echo "--- Complete: jenkins-docker-proxy."
slave1:
	@echo "--- Building jenkins-slave-alpine-php56..."
	docker build -t thoreaudesign/jenkins-slave-alpine-php56 -f jenkins-docker-slaves/alpine-php56/Dockerfile .
	@echo "--- Complete: jenkins-slave-alpine-php56."
slave2:
	@echo "--- Building jenkins-slave-centos7-php56..."
	docker build -t thoreaudesign/jenkins-slave-centos7-php56 -f jenkins-docker-slaves/centos7-php56/Dockerfile .
	@echo "--- Complete: jenkins-slave-centos7-php56."

all: proxy slave1
