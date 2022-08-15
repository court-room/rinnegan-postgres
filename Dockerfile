FROM postgres:14.5-alpine

LABEL maintainer="onlinejudge95"

COPY ./config/db.sql /docker-entrypoint-initdb.d