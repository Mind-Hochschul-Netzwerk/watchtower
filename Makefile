check-traefik:
ifeq (,$(shell docker ps -f name=^traefik$$ -q))
	$(error docker container traefik is not running)
endif

prod: check-traefik
	@echo "Starting Production Server"
	docker-compose up -d --force-recreate --remove-orphans watchtower

upgrade:
	git pull
	make prod

shell:
	docker-compose exec watchtower sh

rootshell:
	docker-compose exec --user root watchtower sh

logs:
	docker-compose logs -f
