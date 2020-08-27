# rinnegan-postgres

[![docker Actions Status](https://github.com/court-room/rinnegan-postgres/workflows/docker/badge.svg)](https://github.com/court-room/rinnegan-postgres/actions)
[![DeepSource](https://static.deepsource.io/deepsource-badge-light-mini.svg)](https://deepsource.io/gh/court-room/rinnegan-postgres/?ref=repository-badge)

## Pre-Requisite

Run the following commands for setting up the dependencies of your database

- Create a network with the given name

  ```bash
  $ docker network create --attachable rinnegan-database
  ```

- Create a volume with the given name

  ```bash
  $ docker volume create rinnegan-data
  ```

## Setup

The databse can be used for locally testing the server or the entire set of services.
In order to use the database start up the container using the following commands

- Build the image

  ```bash
  $ docker-compose build --compress
  ```

- Make sure you have a copy of `.env` file created by using `.env.example` as a template

- Launch the container

  ```bash
  $ docker-compose up --detach
  ```

_OPTIONAL_

There is a shell script at `bin/orchestrate.sh` that handles the container setup, and tails the logs as well.

## Development

- In order to verify that the container is up

  ```bash
  $ docker container ls
  CONTAINER ID        IMAGE                      COMMAND                  CREATED             STATUS              PORTS               NAMES
  c3a4fcc37519        rinnegan-postgres:latest   "docker-entrypoint.s…"   6 seconds ago       Up 5 seconds        5432/tcp            rinnegan_postgres
  ```

- To log in to the container and run custom commands

  ```bash
  $ docker container exec --interactive --tty rinnegan_postgres sh
  / # psql -U rinnegan
  psql (12.2)
  Type "help" for help.

  rinnegan=# \l
                                  List of databases
      Name      |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges
  ---------------+----------+----------+------------+------------+-----------------------
  postgres      | rinnegan | UTF8     | en_US.utf8 | en_US.utf8 |
  rinnegan      | rinnegan | UTF8     | en_US.utf8 | en_US.utf8 |
  rinnegan_dev  | rinnegan | UTF8     | en_US.utf8 | en_US.utf8 |
  rinnegan_test | rinnegan | UTF8     | en_US.utf8 | en_US.utf8 |
  template0     | rinnegan | UTF8     | en_US.utf8 | en_US.utf8 | =c/rinnegan          +
              |          |          |            |            | rinnegan=CTc/rinnegan
  template1     | rinnegan | UTF8     | en_US.utf8 | en_US.utf8 | =c/rinnegan          +
              |          |          |            |            | rinnegan=CTc/rinnegan
  (6 rows)

  rinnegan=#
  ```

## Contact

For any issue please contact the following persons

- [onlinejudge95](https://github.com/onlinejudge95)
