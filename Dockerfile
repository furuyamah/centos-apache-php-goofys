FROM centos:7.3.1611
MAINTAINER furuyamah <furuyamah@isao.co.jp>

RUN yum update -y && \
    yum install -y epel-release && \
    rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && \
    yum install -y \
        crontabs \
        mysql \
        wget \
        fuse \
        git \
        httpd \
        httpd-devel \
        httpd-tools \
        mod_ssl \
        php \
        php-cli \
        php-common \
        php-dba \
        php-devel \
        php-gd \
        php-mbstring \
        php-mcrypt \
        php-mysql \
        php-pdo \
        php-pear \
        php-pecl-memcache \
        php-pecl-apcu \
        php-pecl-ssh2 \
        php-pecl-zendopcache \
        php-xml \
        php-xmlrpc && \
    pecl clear-cache && \
    pear install Crypt_Blowfish 

# for mount S3
RUN mkdir -p /root/go/bin && \
    wget https://github.com/kahing/goofys/releases/download/v0.0.12/goofys -O /root/go/bin/goofys && \
    chmod a+x /root/go/bin/goofys  && \
    mkdir /root/.aws

WORKDIR /var/www

