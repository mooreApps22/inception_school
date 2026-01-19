#!/bin/bash

home="/home/smoore"

spit() {
	echo
	echo "======== CAT $1 ========"
	cat "$1"
	echo
	
}

spit "$home/Makefile"
spit "$home/.env"
spit "$home/srcs/docker-compose.yml"
spit "$home/srcs/requirements/nginx/Dockerfile"
spit "$home/srcs/requirements/wordpress/Dockerfile"
spit "$home/srcs/requirements/mariadb/Dockerfile"
