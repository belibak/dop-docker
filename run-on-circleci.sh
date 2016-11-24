#!/bin/bash
cd sources
git clone git@github.com:broadlook-technologies/Data_Optimization_Prototype.git
cd ..
docker build -f Dockerfile-web .
docker build -f Dockerfile-celery .
docker build -f Dockerfile-websockets .
 
