#!/bin/bash
cd sources
git clone git@github.com:broadlook-technologies/Data_Optimization_Prototype.git
cd ..
echo "Building base image \n\n\n\n"
docker build -t dop-base -f Dockerfile-base .


echo "Building other images \n\n\n\n"
docker build -f Dockerfile-web .
docker build -f Dockerfile-celery .
docker build -f Dockerfile-websockets .
 
