*This project has been created as part of the 42 curriculum by smoore.*

**Developer Documenation**

This document addresses how to set up **Inception**.

**Prerequires:**

You must: 
- be running Linux, most distros should work
- have `docker` installed on your system and you must enable it
- have `docker compose` installed on your system
- have the GNU program `make` 
- copy or git clone `Makefile` file and `srcs/` directory into your `$HOME/` directory
- create a directory called `data/` in your `$HOME` 
- create the directories `~/data/mariadb/` and `~/data/wordress/`
- create a directory `~/secrets/`
- create the following files and fills with a password:
	* `~/secrets/db_password.txt`       
	* `~/secrets/mariadb_root_password.txt`
	* `~/secrets/wp_user_password.txt`
	* `~/secrets/mariadb_password.txt`  
	* `~/secrets/wp_admin_password.txt`
- some `.env` info as well ...

**Build and Launch:**

Below is a handy table which explains how the `Makefile` calls its rules to control the Docker Compose and the containers. Run `make` to build the website, this will call the `all` rule. For every other rule run `make <rule>`.

Makefile Rule Definitions:
- `all` - build Inceptions and docker runs in the background
- `up` - build Inception and docker runs in the foreground
- `upd` - build Inceptions and docker runs in the background
- `down` - stop Inceptions (the website is not longer reachable)
- `down_v` - stops Inceptions AND REMOVIES persistent data
- `restart` - stops Inception and rebuilds it
- `ps` - lists current running containers
- `logs` - outputs logs messages from all containers
- `logs_mariadb` - outputs logs messages from the mariadb containers
- `logs_wordpress` - outputs logs messages from the wordpress container
- `logs_nginx` - outputs longs messages from the nginx container
- `stats` - outputs resource usages of each container
- `prune` - removes all unused images
- `open_nginx` - opens the nginx container and lets you run commands inside
- `open_wordpress` - opens the wordpress container and lets you run commands inside
- `open_mariadb` - opens the mariadb container and lets you run commands inside
- `ls_volumes` - output a table of all the Docker volumes on the system
- `inspect_volume_wordpress` - output key attributes associated with the volume
- `inspect_volume_maria` - output key attributes associated with the volume

[Cheat Sheet](https://docs.docker.com/get-started/docker_cheatsheet.pdf)

**Volume and Data**

All data is housed in the `inception_wordpress` and `inception_mariadb` volume which are located at `~/data/mariadb/` or `~/data/wordpress/` directories. In mariadb, you have all the database files and folders. Then in the wordpress you have all the files that make the webpages.

