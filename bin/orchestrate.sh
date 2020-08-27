#!/bin/bash

clear
docker-compose build --compress --force-rm --parallel
docker-compose up --detach --remove-orphans