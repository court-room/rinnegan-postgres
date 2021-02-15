FROM postgres:13.2-alpine

LABEL maintainer="onlinejudge95"

COPY ./config/db.sql /docker-entrypoint-initdb.d