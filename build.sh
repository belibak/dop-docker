#!/bin/bash

docker build -t ringleaddev/base -f Dockerfile-base .
docker-compose build 

