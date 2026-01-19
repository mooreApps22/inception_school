#!/bin/sh
set -e

mkdir -p /etc/nginx/ssl

openssl genrsa -out /etc/nginx/ft_private.key 2048

openssl rsa -in /etc/nginx/ft_private.key -pubout -out /etc/nginx/ft_public.key


openssl req \
	-new -x509 \
	-key /etc/nginx/ft_private.key \
	-out /etc/nginx/ft_cert.crt \
	-days 365 \
	-subj "$SSL_SUBJECT"
