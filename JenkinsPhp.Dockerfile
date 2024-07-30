# This file is part of the Universal Docker stand for web development project.
#
# This project is no longer maintained.
# The project is written as Universal Docker stand Release.
#
# @link https://github.com/scorpion3dd
# @author Denis Puzik <scorpion3dd@gmail.com>
# @copyright Copyright (c) 2022-2023 scorpion3dd

FROM php:8.3-fpm

MAINTAINER scorpion3dd
LABEL maintainer="agent-php82-symfony6-learn"
LABEL version="1.0"

COPY jenkins.php.ini /usr/local/etc/php/conf.d/docker-php-config.ini

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    gnupg \
    g++ \
    procps \
    openssl \
    git \
    unzip \
    zlib1g-dev \
    libzip-dev \
    libfreetype6-dev \
    libpng-dev \
    libjpeg-dev \
    libicu-dev  \
    libonig-dev \
    libxslt1-dev \
    libpq-dev \
    acl && \
    echo 'alias sf="php bin/console"' >> ~/.bashrc

RUN docker-php-ext-configure gd --with-jpeg --with-freetype

ARG PHP_TIMEZONE
ARG PHP_USER_ID
ARG PHP_USER_NAME
ARG PHP_GROUP_ID
ARG PHP_GROUP_NAME
ARG PHP_CORS_ALLOW_ORIGIN
ARG COMPOSER_MEMORY_LIMIT
ARG PHP_INSTALL_XDEBUG

RUN echo "PHP_TIMEZONE: ${PHP_TIMEZONE}"
RUN echo "PHP_USER_ID: ${PHP_USER_ID}"
RUN echo "PHP_USER_NAME: ${PHP_USER_NAME}"
RUN echo "PHP_GROUP_ID: ${PHP_GROUP_ID}"
RUN echo "PHP_GROUP_NAME: ${PHP_GROUP_NAME}"
RUN echo "PHP_CORS_ALLOW_ORIGIN: ${PHP_CORS_ALLOW_ORIGIN}"
RUN echo "COMPOSER_MEMORY_LIMIT: ${COMPOSER_MEMORY_LIMIT}"
RUN echo "PHP_INSTALL_XDEBUG: ${PHP_INSTALL_XDEBUG}"

RUN if [ ${PHP_INSTALL_XDEBUG} = true ]; \
    then \
      pecl install xdebug-3.3.2 && docker-php-ext-enable xdebug; \
    fi;

RUN apt-get update && apt-get install -y libmongoc-dev libssl-dev
RUN pecl install mongodb && docker-php-ext-enable mongodb

RUN pecl install redis && docker-php-ext-enable redis

RUN docker-php-ext-install pdo pdo_mysql mysqli pdo_pgsql pgsql zip xsl gd intl opcache exif mbstring

RUN apt-get update && apt-get install -y libmagickwand-dev
RUN pecl install imagick && docker-php-ext-enable imagick

RUN apt-get update && apt-get install -y telnet mc iputils-ping net-tools htop netcat-traditional vim redis-tools kafkacat

RUN apt-get update && apt-get install -y librabbitmq-dev
RUN pecl install amqp && docker-php-ext-enable amqp

RUN curl -sL https://deb.nodesource.com/setup_20.x  | bash
RUN apt-get update && apt-get install -y nodejs

RUN apt-get update && apt-get install -y xsltproc

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony5/bin/symfony /usr/local/bin/symfony


RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    lsb-release

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io


ARG MONGO_HOST
ARG MONGO_PORT
ARG MONGO_CONNECT_USER
ARG MONGO_CONNECT_PASSWORD
ARG MONGO_CONNECT_DB
ARG MONGO_CONNECT_DB_INTEGRATION
ARG MONGO_CONNECT_COLLECTION
ARG MONGO_INITDB_ROOT_USERNAME
ARG MONGO_INITDB_ROOT_PASSWORD

ARG DATABASE_URL
ARG MYSQL_HOST
ARG MYSQL_PORT
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_DATABASE_INTEGRATION
ARG MYSQL_USER_INTEGRATION
ARG MYSQL_PASSWORD_INTEGRATION

ARG REDIS_HOST
ARG REDIS_URL

ARG POSTGRES_HOST
ARG POSTGRES_PORT
ARG POSTGRES_USER
ARG POSTGRES_PASSWORD
ARG POSTGRES_DB

ARG KAFKA_HOST
ARG KAFKA_PORT
ARG KAFKA_BROKER_VERSION

ARG TERM

RUN ln -snf /usr/share/zoneinfo/${PHP_TIMEZONE} /etc/localtime && echo ${PHP_TIMEZONE} > /etc/timezone \
    && printf '[PHP]\ndate.timezone = "%s"\n', ${PHP_TIMEZONE} > /usr/local/etc/php/conf.d/tzone.ini \
    && "date"

RUN apt-get update && apt-get install -y sudo


USER root
RUN adduser --uid 1000 agentjenkinsphp
RUN echo "agentjenkinsphp:agentjenkinsphp" | chpasswd
RUN usermod -aG sudo agentjenkinsphp
RUN usermod -aG root agentjenkinsphp
RUN gpasswd -a agentjenkinsphp docker

RUN chown -R agentjenkinsphp:agentjenkinsphp /var/log
RUN chmod -R 777 /var/log

COPY JenkinsEntrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/JenkinsEntrypoint.sh
#ENTRYPOINT ["JenkinsEntrypoint.sh"]

USER agentjenkinsphp


#RUN usermod -u ${PHP_USER_ID} ${PHP_USER_NAME} && groupmod -g ${PHP_GROUP_ID} ${PHP_GROUP_NAME}

WORKDIR /var/www/back

ENV DATABASE_URL=${DATABASE_URL}
ENV MYSQL_HOST=${MYSQL_HOST}
ENV MYSQL_PORT=${MYSQL_PORT}
ENV MYSQL_DATABASE=${MYSQL_DATABASE}
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}
ENV MYSQL_DATABASE_INTEGRATION=${MYSQL_DATABASE_INTEGRATION}
ENV MYSQL_USER_INTEGRATION=${MYSQL_USER_INTEGRATION}
ENV MYSQL_PASSWORD_INTEGRATION=${MYSQL_PASSWORD_INTEGRATION}

ENV MONGO_HOST=${MONGO_HOST}
ENV MONGO_PORT=${MONGO_PORT}
ENV MONGO_CONNECT_USER=${MONGO_CONNECT_USER}
ENV MONGO_CONNECT_PASSWORD=${MONGO_CONNECT_PASSWORD}
ENV MONGO_CONNECT_DB=${MONGO_CONNECT_DB}
ENV MONGO_CONNECT_DB_INTEGRATION=${MONGO_CONNECT_DB_INTEGRATION}
ENV MONGO_CONNECT_COLLECTION=${MONGO_CONNECT_COLLECTION}
ENV MONGO_INITDB_ROOT_USERNAME=${MONGO_INITDB_ROOT_USERNAME}
ENV MONGO_INITDB_ROOT_PASSWORD=${MONGO_INITDB_ROOT_PASSWORD}

ENV REDIS_HOST=${REDIS_HOST}
ENV REDIS_URL=${REDIS_URL}

ENV POSTGRES_HOST=${POSTGRES_HOST}
ENV POSTGRES_PORT=${POSTGRES_PORT}
ENV POSTGRES_USER=${POSTGRES_USER}
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
ENV POSTGRES_DB=${POSTGRES_DB}

ENV KAFKA_HOST=${KAFKA_HOST}
ENV KAFKA_PORT=${KAFKA_PORT}
ENV KAFKA_BROKER_VERSION=${KAFKA_BROKER_VERSION}

ENV PHP_CORS_ALLOW_ORIGIN=${PHP_CORS_ALLOW_ORIGIN}
ENV COMPOSER_MEMORY_LIMIT=${COMPOSER_MEMORY_LIMIT}
ENV TERM=${TERM}

#RUN chown -R ${PHP_USER_NAME}:${PHP_GROUP_NAME} /var/www/back
#RUN chown -R www-data:www-data /var/www/back

#USER "${PHP_USER_ID}:${PHP_GROUP_ID}"

CMD ["php-fpm"]