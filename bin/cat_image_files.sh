#!/bin/bash

home="/home/smoore"

spit() {
	echo
	echo "======== CAT $1 ========"
	cat "$1"
	echo
	
}

spit "$home/srcs/requirements/nginx/utils/gen_ssl.sh"
spit "$home/srcs/requirements/nginx/utils/nginx.conf"

spit "$home/srcs/requirements/wordpress/entrypoint.sh"
spit "$home/srcs/requirements/wordpress/www.conf"

spit "$home/srcs/requirements/mariadb/utils/entrypoint.sh"
spit "$home/srcs/requirements/mariadb/utils/my.cnf"
