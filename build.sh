#!/bin/bash

docker build -t ringleaddev/base -f Dockerfile-base .
docker push ringleaddev/base
docker-compose build 

