#!/bin/bash

clear

docker build  --compress --force-rm --tag rinnegan-postgres:latest .

docker image tag rinnegan-postgres:latest localhost:6000/rinnegan-postgres:latest

docker push localhost:6000/rinnegan-postgres:latest
