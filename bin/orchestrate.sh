#!/bin/bash

clear
docker-compose build --compress --force-rm --parallel
docker-compose up --detach --remove-orphans

docker push localhost:5000/postgres

docker-compose logs --follow postgres