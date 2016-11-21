#!/bin/bash
#git clone https://github.com/broadlook-technologies/Data_Optimization_Prototype.git
cd sources
git clone git@github.com:broadlook-technologies/Data_Optimization_Prototype.git
docker build -t web .
