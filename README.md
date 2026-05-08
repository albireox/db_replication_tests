# db_replication_tests

Some code to test replication between two PostgreSQL instances running in Docker containers.

## Setup

- Run the two PostgreSQL services (`dbalpha` and `dbbeta`) using the provided `docker-compose.yaml` file with `docker-compose up`.
- The `docker-compose.yaml` mounts the `postgresql.conf` and `pg_hba.conf` files into the containers. In particular the `pg_hba.conf` file is configured to allow replication connections from the container network and passwordless authentication for simplicity. The DB user is `postgres`.
- Run `scripts/setup_replication.sh` to create a simple `mytable` table in both servers and set up replication.

## Connecting to the databases

`dbalpha` is available on port `15432` and `dbbeta` is available on port `15433`. You can connect to them using `psql` or any other PostgreSQL client.

```bash
psql -h localhost -p 15432 -U postgres
```
