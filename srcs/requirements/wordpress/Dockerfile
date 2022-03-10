FROM	debian:buster

RUN apt-get update && apt-get install -y \
	wget \
	mariadb-client \
	php php-mysql php-fpm php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	mkdir -p /var/www/html /run/php

COPY	./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

WORKDIR /var/www/html

EXPOSE	9000

COPY		./tools/wp_init.sh /
ENTRYPOINT	["sh", "/wp_init.sh"]