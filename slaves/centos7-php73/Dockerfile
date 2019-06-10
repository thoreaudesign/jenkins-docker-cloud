FROM centos
ENV container docker
#Update yum
RUN yum -y update; yum clean all

#Install epel and yum-utils
RUN yum -y install epel-release yum-utils

#Install supporting applications 
RUN yum -y install git \
                make-3.82-23.el7.x86_64 \
                wget-1.14-18.el7.x86_64 \
                unzip-6.0-19.el7.x86_64 \
                java-1.8.0-openjdk

#Install Remi repository
RUN yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm

#Enable Remi repository
RUN yum-config-manager --enable remi-php73

#Install PHP 7.3
RUN yum -y install php \
                    php-common \
                    php-opcache \
                    php-mcrypt \
                    php-cli \
                    php-gd \
                    php-curl \
                    php-mysqlnd

#Install composer
RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet
RUN mv composer.phar /usr/local/bin/composer

#Install kherge/box
RUN composer global require kherge/box
RUN ln -s /root/.composer/vendor/kherge/box/bin/box /usr/local/bin/ 

#Disable phar.readonly in php config
RUN sed -i 's/;phar.readonly = On/phar.readonly = Off/' /etc/php.ini

#Enable jenkins-remoting
COPY slaves/jenkins-remoting/slave.jar /usr/share/jenkins/slave.jar
COPY slaves/jenkins-remoting/jenkins-slave /usr/local/bin/jenkins-slave
CMD ["/bin/bash"]
