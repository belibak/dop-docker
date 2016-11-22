#!/bin/bash
#sleep 120
DOP=/Data_Optimization_Prototype
CFGS=/cfgs/configs
CRDS=/cfgs/creds
NVM_DIR=/usr/local/nvm

function fe() {
  if [ -f $1 ]
    then 
      cp $1 $2 
    else
      echo "file $1 not exists"
      exit 1
    fi
}

fe $CFGS/websockets/websocket.conf.py "$DOP"/rl_proto2/conf/websocket.conf.py
fe $CFGS/websockets/Socket.js $DOP/react/app/utils/Socket.js 
fe $CFGS/websockets/webpack.config.js $DOP/react/webpack.config.js

fe $CRDS/local_settings.py $DOP/rl_proto2/local_settings.py
fe $CRDS/salesforce/local_settings.py $DOP/integrations/salesforce/local_settings.py 

cd $DOP/react 
source $NVM_DIR/nvm.sh
#npm run build-amazon
cd $DOP

service supervisor start
tail -f /var/log/app.log
