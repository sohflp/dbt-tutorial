seed:
	docker-compose -f .docker/docker-compose.yml run dbt-postgres "dbt seed"

run:
	docker-compose -f .docker/docker-compose.yml run dbt-postgres "dbt run"