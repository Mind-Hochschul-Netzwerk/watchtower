check-traefik:
ifeq (,$(shell docker ps -f name=^traefik$$ -q))
	$(error docker container traefik is not running)
endif

prod: check-traefik
	@echo "Starting Production Server"
	docker-compose up -d --force-recreate --remove-orphans app

upgrade:
	git pull
	make prod

shell:
	docker-compose exec app sh

rootshell:
	docker-compose exec --user root app sh

logs:
	docker-compose logs -f
