# DBT (Data Build Tool) tutorial

This project contains basic artefacts for DBT usage.

Two containers are configured via docker-compose in the folder `.docker`:
1. postgres:14.1
2. dbt-postgres:1.2

To start a new DBT instance and interact via terminal, use the command below:

```
docker-compose run dbt-postgres
```

The Postgres database is initiated automatically from the command above.
