# DBT (Data Build Tool) tutorial

This project contains basic artefacts to support DBT learning and experimentation.

We make use of Docker containers to simplify the process, there is no need to install **DBT CLI** while using this technique.

Two containers are configured via docker-compose in the folder `.docker`:
1. postgres:14.1
2. dbt-postgres:1.2

## Execute DBT commands via Makefile

The following commands are shortcuts to perform the main operations via **DBT CLI**:

**dbt seed**
```
make seed
```

**dbt run**
```
make run
```

**dbt test**
```
make test
```

**Important note**: The Postgres database is initiated automatically from the commands above.

## Start terminal shell with DBT CLI

Alternatively, you can start DBT CLI via terminal with the following command:

```
make shell
```

And run the DBT commands manually such as:

```
dbt seed
dbt run
dbt test
```

## Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
