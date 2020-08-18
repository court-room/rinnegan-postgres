# rinnegan-postgres

[![docker Actions Status](https://github.com/court-room/rinnegan-postgres/workflows/docker/badge.svg)](https://github.com/court-room/rinnegan-postgres/actions)
[![DeepSource](https://static.deepsource.io/deepsource-badge-light-mini.svg)](https://deepsource.io/gh/court-room/rinnegan-postgres/?ref=repository-badge)

## Pre-Requisite

Run the following commands for setting up the dependencies of your database

- Create a network with the given name

  ```bash
  $ docker network create --attachable rinnegan-backend
  6fcd14420464df8b6e1cba8d7007d99bdad9d76126b10f413907cc64b195cb53
  ```

- Create a volume with the given name

  ```bash
  $ docker volume create rinnegan-data
  rinnegan-data
  ```

## Setup

The databse can be used for locally testing the server or the entire set of services.
In order to use the database start up the container using the following commands

- Build the image

  ```bash
  $ docker-compose build --compress
  Building postgres
  Step 1/3 : FROM postgres:12.2-alpine
  12.2-alpine: Pulling from library/postgres
  cbdbe7a5bc2a: Pull complete
  b52a8a2ca21a: Pull complete
  e36a19831e31: Pull complete
  f4dcdeed24b7: Pull complete
  e261f2444b0a: Pull complete
  0ff301de3ecf: Pull complete
  1d858bf02c95: Pull complete
  7958b7df2951: Pull complete
  Digest: sha256:9ea72265275674225b1eaa2ae897dd244028af4ee7ef6e4e89fe474938e0992e
  Status: Downloaded newer image for postgres:12.2-alpine
  ---> ae192c4d3ada
  Step 2/3 : LABEL maintainer="onlinejudge95"
  ---> Running in e249f8f4bfec
  Removing intermediate container e249f8f4bfec
  ---> e75209e04a77
  Step 3/3 : COPY ./db.sql /docker-entrypoint-initdb.d
  ---> 6867730996b1

  Successfully built 6867730996b1
  Successfully tagged rinnegan-postgres:latest
  ```

- Make sure you have a copy of `.env` file created by using `.env.example` as a template

- Launch the container

  ```bash
  $ docker-compose up --detach
  Creating rinnegan_postgres ... done
  ```

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
