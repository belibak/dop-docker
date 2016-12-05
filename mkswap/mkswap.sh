#!/bin/bash
file=/swp/swap
if [ -z "$1" ]
    then
    size=1048576
    else
    let "size=$1*1024"        
    fi


mkdir /swp
dd if=/dev/zero of="$file" bs=1024 count="$size"
chmod 600 $file
mkswap $file
swapon $file

#echo "Write changes to /etc/fstab? (y/N)"
#read q
#if [ $q == "y"]
#then
echo "write next line into /etc/fstab"
echo "echo \"$file none swap sw 0 0\" >> /etc/fstab"
