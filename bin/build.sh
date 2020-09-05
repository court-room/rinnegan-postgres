#!/bin/bash

ACTION=$1

clear
docker-compose build --compress --force-rm

docker image tag rinnegan-postgres:latest localhost:6000/rinnegan-postgres:latest

docker push localhost:6000/rinnegan-postgres:latest
