#!/bin/bash

docker build -t dop-base -f Dockerfile-base .
docker-compose build 

