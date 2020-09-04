#!/bin/bash

clear
docker-compose build --compress --force-rm --parallel
docker-compose up --detach --remove-orphans

docker image tag rinnegan-postgres:latest localhost:5000/rinnegan-postgres:latest

docker push localhost:5000/rinnegan-postgres:latest

docker-compose logs --follow postgres