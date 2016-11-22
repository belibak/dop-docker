#!/bin/bash
cd sources
git clone git@github.com:broadlook-technologies/Data_Optimization_Prototype.git
cd ..
docker-compose build 
