FROM centos
ENV container docker
RUN yum -y update; yum clean all
RUN yum -y install epel-release
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN yum -y install php56w \
                    git \
                    make-3.82-23.el7.x86_64 \
                    wget-1.14-18.el7.x86_64 \
                    unzip-6.0-19.el7.x86_64 \
                    java-1.8.0-openjdk
RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet
RUN mv composer.phar /usr/local/bin/composer
RUN composer global require kherge/box
RUN ln -s /root/.composer/vendor/kherge/box/bin/box /usr/local/bin/ 
RUN sed -i 's/; phar.readonly = On/phar.readonly = Off/' /etc/php.ini
COPY jenkins-docker-slaves/jenkins-remoting/slave.jar /usr/share/jenkins/slave.jar
COPY jenkins-docker-slaves/jenkins-remoting/jenkins-slave /usr/local/bin/jenkins-slave
CMD ["/bin/bash"]
