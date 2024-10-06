#!/usr/bin/env -S docker build . --tag=ateuco:v1 --network=host --file

FROM php:8.1-apache

RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable mysqli pdo pdo_mysql

RUN a2enmod rewrite
RUN a2enmod headers
RUN a2enmod ssl

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y git mc zlib1g-dev libzip-dev libpng-dev nano vim --no-install-recommends \
    && docker-php-ext-install zip

RUN apt-get install -y libmcrypt-dev
RUN pecl install mcrypt-1.0.6 && docker-php-ext-enable mcrypt

RUN docker-php-ext-install opcache && docker-php-ext-enable opcache
RUN docker-php-ext-install gd

RUN pecl channel-update pecl.php.net
RUN pecl install xdebug-3.1.6 && docker-php-ext-enable xdebug

RUN apt install -y libmemcached-dev zlib1g-dev libssl-dev

RUN yes '' | pecl install -f memcached-3.2.0 \
  && docker-php-ext-enable memcached

RUN apt-get -y update \
    && apt-get install -y libicu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        libxml2-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
    && apt-get clean

#RUN docker-php-ext-install mbstring pgsql

RUN docker-php-ext-install sockets && docker-php-ext-enable sockets
RUN docker-php-ext-install soap && docker-php-ext-enable soap

RUN apt-get update -y
RUN apt-get install -y iputils-ping

RUN printf '[date]\ndate.timezone = Europe/Moscow\n\n' > /usr/local/etc/php/conf.d/php.ini

RUN touch /var/log/apache2/php_errors.log && chown www-data:www-data /var/log/apache2/php_errors.log

RUN printf '[errors]\nlog_errors = on \nerror_log = /var/log/apache2/php_errors.log\n\n' > /usr/local/etc/php/conf.d/php.ini

RUN printf '[xdebug]\nzend_extension="xdebug.so"\nxdebug.mode=debug\nxdebug.client_host="127.0.0.1"\nxdebug.client_port="9003"\n\n' > /usr/local/etc/php/conf.d/php.ini

RUN curl -sS https://getcomposer.org/installer \
    | php -- --install-dir=/usr/local/bin --filename=composer

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN cd /etc/apache2 && mkdir ssl && cd ssl && openssl req -new -x509 -days 1461 -nodes -out cert.pem -keyout cert.key -subj "/C=RU/ST=SPb/L=SPb/O=example Company/OU=IT Department/CN=example.com/CN=development"

RUN apt-get update && apt-get install -y libmagickwand-dev --no-install-recommends
RUN printf "\n" | pecl install imagick
RUN docker-php-ext-enable imagick

RUN apt-get update && apt-get install -y cron
RUN touch /var/log/cron.log && chown www-data:www-data /var/log/cron.log

RUN echo "@reboot sleep 60 && curl http://127.0.0.1/api/on-start" > /etc/cron.d/root
RUN echo "*/1 * * * * curl http://127.0.0.1/api/on-tick" >> /etc/cron.d/root
RUN crontab /etc/cron.d/root
RUN chmod 0644 /etc/cron.d/root

RUN apt-get -y update && apt-get install -y nodejs npm

ENV LOCALTIME Europe/Moscow
ENV HTTPD_CONF_DIR /etc/apache2/conf-enabled/
ENV HTTPD__DocumentRoot /var/www
ENV HTTPD__LogFormat '"%a %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-agent}i\"" common'

RUN echo 'sendmail_path = /usr/sbin/ssmtp -t' >> $PHP_INI_DIR/conf.d/00-default.ini && \
    sed -i "s/DocumentRoot.*/DocumentRoot \${HTTPD__DocumentRoot}/"  /etc/apache2/apache2.conf && \
    echo 'ServerName ${HOSTNAME}' > $HTTPD_CONF_DIR/00-default.conf && \
    echo 'ServerSignature Off' > /etc/apache2/conf-enabled/z-security.conf && \
    echo 'ServerTokens Minimal' >> /etc/apache2/conf-enabled/z-security.conf && \
    chmod a+w -R $HTTPD_CONF_DIR/ /etc/apache2/mods-enabled $PHP_INI_DIR/ && \
    rm /etc/apache2/sites-enabled/000-default.conf

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
