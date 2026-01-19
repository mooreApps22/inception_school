FROM alpine:3.22

RUN apk add --no-cache \
	php83 \
	php83-fpm \
	php83-mysqli \
	php83-pdo \
	php83-pdo_mysql \
	php83-session \
	php83-json \
	php83-opcache \
	php83-mbstring \
	php83-xml \
	php83-curl \
	php83-gd \
	php83-ctype \
	php83-phar \
	php83-zip \
	php83-fileinfo \
	php83-dom \
	php83-tokenizer \
	mariadb-client \
	curl \
	tar \
	unzip \
	ca-certificates \
	su-exec

RUN echo "display_errors = On" >> /etc/php83/php.ini \
	&& echo "memory_limit = 256M" >> /etc/php83/php.ini \
	&& echo "upload_max_filesize = 64M" >> /etc/php83/php.ini \
	&& echo "post_max_size = 64M" >> /etc/php83/php.ini

RUN addgroup -S nginx && adduser -S -G nginx nginx

COPY www.conf /etc/php83/php-fpm.d/www.conf

#__________________Install WordPress__________________________

RUN curl -fsSL -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x /usr/local/bin/wp \
	&& wp --info

ARG WP_VERSION=latest
RUN mkdir -p /usr/src/wordpress \
	&& curl -fsSL https://wordpress.org/wordpress-${WP_VERSION}.tar.gz \
		| tar -xz --strip-components=1 -C /usr/src/wordpress

# optional: add seed theme/plugin/mu-plugins here (copied into wp-content later)
# COPY seedwp-content/ /usr/src/wordpress/wp-content/
#__________________________________________________________

COPY entrypoint.sh /entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm83", "-F"]
