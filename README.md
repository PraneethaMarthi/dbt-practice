# dbt-practice
A mini project to practice dbt


# Prerequisities
- Install docker desktop on the local development environment
```shell
Download docker desktop from 
https://www.docker.com/products/docker-desktop/ and install the dmg file on the device
```
- Setup pyenv; Use pyenv global as 3.11
```shell
brew install pyenv
pyenv install 3.11
pyenv global 3.11
```
- Install poetry
```shell
pip install poetry
```


## Bring up local postgres database
docker compose up -d


## dbt project setup
```
cd dbt-practice

# to install dbt dependencies
poetry install

# launch poetry shell
poetry shell

# check dbt postgres env connectivity
cd postgres_dbt_practice
dbt debug

```

## 14OCT24
```

# Create a Docker Volume: docker volume create postgres_data
Purpose: Store data persistently and mount it to the PostgreSQL container. 

# Run a PostgreSQL Container and Mount a Volume

COPY customers
FROM '/docker_data/customer_data.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM customers;

1000-Products,100-Stores,100k-Sales,1000-Customers
