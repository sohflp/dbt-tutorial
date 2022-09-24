# DBT (Data Build Tool) tutorial

This project contains basic artefacts for DBT usage.

Two containers are configured via docker-compose in the folder `.docker`:
1. postgres:14.1
2. dbt-postgres:1.2

To execute the DBT commands you can make use of the following shortcuts:

**dbt seed**
```
make seed
```

**dbt run**
```
make run
```

The Postgres database is initiated automatically from the commands above.
