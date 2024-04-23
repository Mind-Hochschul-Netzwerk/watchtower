prod:
	@echo "Starting Production Server"
	docker compose up -d --force-recreate --remove-orphans app

upgrade:
	git pull
	make prod

shell:
	docker compose exec app sh

rootshell:
	docker compose exec --user root app sh

logs:
	docker compose logs -f
