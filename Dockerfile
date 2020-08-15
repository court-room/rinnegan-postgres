FROM postgres:12.4-alpine

LABEL maintainer="onlinejudge95"

COPY ./db.sql /docker-entrypoint-initdb.d