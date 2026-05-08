#!/usr/bin/env bash

psql -U postgres -h localhost -p 15432 -c "CREATE TABLE mytable (pk SERIAL PRIMARY KEY, column1 VARCHAR(255));"
psql -U postgres -h localhost -p 15433 -c "CREATE TABLE mytable (pk SERIAL PRIMARY KEY, column1 VARCHAR(255));"

psql -U postgres -h localhost -p 15432 -c "CREATE PUBLICATION pub_db_alpha FOR TABLE mytable;"
psql -U postgres -h localhost -p 15433 -c "CREATE PUBLICATION pub_db_beta FOR TABLE mytable;"

psql -U postgres -h localhost -p 15432 -c "CREATE SUBSCRIPTION sub_db_beta CONNECTION 'host=172.20.0.3 port=5432 user=postgres dbname=postgres' PUBLICATION pub_db_beta WITH (origin = 'none');"
psql -U postgres -h localhost -p 15433 -c "CREATE SUBSCRIPTION sub_db_alpha CONNECTION 'host=172.20.0.2 port=5432 user=postgres dbname=postgres' PUBLICATION pub_db_alpha WITH (origin = 'none');"
