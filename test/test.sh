#!/bin/bash
CNT=0
while [ $CNT -lt 50 ]; do
    #docker logs dop-web 
    for i in $(docker logs dop-web); do
      if [ "$i" == "32167" ]; then
       #echo "$i 321321321"
       if [ $(curl -I http://127.0.0.1 | head -n 1 | cut -d$' ' -f2) == 200 ]; then echo 200 > /tmp/status.dop; fi
       docker-compose down
       exit 0
      fi 
    done
    let CNT=CNT+1
    echo "waiting until web-conreiner starts"
    sleep 10 
done 
exit 404
