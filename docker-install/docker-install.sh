#!/bin/bash

APTFILE=/etc/apt/sources.list.d/docker.list

if [ -z $1 ]
  then
    echo "set ubuntu version: install-docker 16.04"
    exit 1
  else
		case $1 in
		  "16.04")
			APT="deb https://apt.dockerproject.org/repo ubuntu-xenial main"
			;;
		  "14.04")
			APT="deb https://apt.dockerproject.org/repo ubuntu-trusty main"
			;;
	  	  *)
			echo "For now you can choice only 14.04 and 16.04"	   
		;; 
		esac  
fi

sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates python-pip -y
sudo pip install docker-compose
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo "$APT" > /tmp/docker.list
sudo cp /tmp/docker.list "$APTFILE"

sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual -y
sudo apt-get install docker-engine -y
sudo service docker start

sudo docker run hello-world

sudo usermod -aG docker $(whoami)
