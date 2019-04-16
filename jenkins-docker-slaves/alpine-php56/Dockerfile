FROM alpine

# Update package manager.
RUN apk update && \
    apk add ca-certificates wget && \
    update-ca-certificates

# Add development tools.
RUN apk add build-base

# Add utilities.
RUN apk add bzip2 \
            git \
            make \
            unzip \
            openjdk8 \
            libxml2 \
            libxml2-dev \
            m4 \
            perl 

# Install Bison from source for PHP - alpine package is incompatible.
RUN wget http://mirrors.syringanetworks.net/gnu/bison/bison-3.3.tar.gz && \
    tar xzf bison-3.3.tar.gz
RUN bison-3.3/configure && \
    make && \
    make install && \
    rm -f Makefile

# Install OpenSSL from source for PHP - alpine package is incompatible.
RUN wget https://www.openssl.org/source/openssl-1.0.2o.tar.gz && \
    tar xzf openssl-1.0.2o.tar.gz && \
    cd openssl-1.0.2o && \
    ./config --prefix=/usr/local/ssl --openssldir=/usr/local/ssl shared zlib && \
    make && \
    make install

# Install PHP 5.6 from source.
RUN wget https://www.php.net/distributions/php-5.6.40.tar.bz2 && \
    tar xjf php-5.6.40.tar.bz2
RUN cd php-5.6.40/ && \
    ./configure --with-openssl --with-zlib && \
    make && \
    make install

# Install composer.
RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet
RUN mv composer.phar /usr/local/bin/composer

# Install kherge/box.
RUN composer global require kherge/box

# Add Jenkins slave remoting. 
COPY jenkins-remoting/slave.jar /usr/share/jenkins/slave.jar
COPY jenkins-remoting/jenkins-slave /usr/local/bin/jenkins-slave

CMD ["bin/bash"]
