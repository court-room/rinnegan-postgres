#!/bin/bash

clear
docker-compose up --build --detach
docker-compose logs --follow postgres