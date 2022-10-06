seed:
	docker-compose -f .docker/docker-compose.yml run dbt-postgres "dbt seed"

run:
	docker-compose -f .docker/docker-compose.yml run dbt-postgres "dbt run"

test:
	docker-compose -f .docker/docker-compose.yml run dbt-postgres "dbt test"

shell:
	docker-compose -f .docker/docker-compose.yml run --entrypoint "/bin/bash" dbt-postgres