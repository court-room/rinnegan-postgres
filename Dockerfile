FROM postgres:12.4-alpine

LABEL maintainer="onlinejudge95"

WORKDIR /etc/postgresql

COPY ./config/db.sql /docker-entrypoint-initdb.d

COPY ./config ./

RUN chown -R postgres ./ssl/private.pem \
    && chmod 600 ./ssl/private.pem
