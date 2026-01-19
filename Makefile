YAM = ./srcs/docker-compose.yml
ENVFILE = srcs/.env
ENV = --env-file $(ENVFILE)

SECRETS = 	secrets/mariadb_root_password.txt \
			secrets/mariadb_password.txt \
			secrets/wp_admin_password.txt \
			secrets/wp_user_password.txt

DATA_DIR =	data
DB_DIR =	$(DATA_DIR)/mariadb
WP_DIR =	$(DATA_DIR)/wordpress

include $(ENVFILE)
export

all: tls data
	docker compose $(ENV) -f $(YAM) up -d --build
up:
	docker compose $(ENV) -f $(YAM) up --build
upd:
	docker compose $(ENV) -f $(YAM) up -d --build
down:
	docker compose $(ENV) -f $(YAM) down
down_v:
	docker compose $(ENV) -f $(YAM) down -v
restart:
	docker compose $(ENV) -f $(YAM) down
	docker compose $(ENV) -f $(YAM) up -d --build
ps:
	docker compose $(ENV) -f $(YAM) ps 
stats:
	docker container stats
logs:
	docker compose $(ENV) -f $(YAM) logs
logs_mariadb:
	docker logs mariadb
logs_wordpress:
	docker logs wordpress 
logs_nginx:
	docker logs nginx
prune:
	docker builder prune --all
open_nginx:
	docker exec -it nginx /bin/sh
open_wordpress:
	docker exec -it wordpress /bin/sh
open_mariadb:
	docker exec -it mariadb /bin/sh
ls_volumes:
	docker volume ls	
inspect_volume_wordpress:
	docker volume inspect inception_wordpress
inspect_volume_maria:
	docker volume inspect inception_mariadb
volume_report: ls_volumes inspect_volume_maria inspect_volume_wordpress
tls:
	@mkdir -p secrets
	@test -f secrets/nginx_tls_key.pem || openssl genrsa -out secrets/nginx_tls_key.pem 2048
	@test -f secrets/nginx_tls_cert.crt || openssl req -new -x509 -key secrets/nginx_tls_key.pem \
		-out secrets/nginx_tls_cert.crt -days 365 \
		-subj "$(SSL_SUBJECT)"

secrets:$(SECRETS)

$(SECRETS):
	@mkdir -p secrets
	@touch $@

data:
	@mkdir -p $(DB_DIR)
	@mkdir -p $(WP_DIR)

test_port_80_1:
	curl -v --max-time 3 http://$(LOGIN).42.fr/
test_port_80_2:
	nc -vz $(LOGIN).42.fr 80

.PHONY: all secrets data
