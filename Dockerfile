FROM postgres:13.1-alpine

LABEL maintainer="onlinejudge95"

COPY ./config/db.sql /docker-entrypoint-initdb.d