FROM php:7.2.10-fpm

RUN apt-get update \
    && apt-get install -y --no-install-recommends vim curl debconf git apt-transport-https apt-utils \
    build-essential locales acl mailutils wget zip unzip mc \
    gnupg gnupg1 gnupg2 \
    zlib1g-dev \
    sudo

RUN docker-php-ext-install pdo pdo_mysql zip

COPY php.ini /usr/local/etc/php/php.ini
COPY php-fpm-pool.conf 	/usr/local/etc/php/pool.d/www.conf
COPY install_sf.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/install_sf.sh

RUN curl -sSk https://getcomposer.org/installer | php -- --disable-tls && \
	mv composer.phar /usr/local/bin/composer

RUN wget https://get.symfony.com/cli/installer -O - | bash && \
    mv ~/.symfony/bin/symfony /usr/local/bin/symfony

RUN groupadd dev -g 999 && \
    useradd dev -g dev -d /home/dev -m  && \
    passwd -d dev && \
    echo "dev ALL=(ALL) ALL" > /etc/sudoers

RUN rm -rf /var/lib/apt/lists/*  && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

WORKDIR /home/wwwroot/

EXPOSE 9000
CMD ["php-fpm"]
