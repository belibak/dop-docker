#!/bin/bash
VENV=/venv
sleep 5
cd /Data_Optimization_Prototype/
cp react /builded/ -r
source $VENV/bin/activate && $VENV/bin/python $VENV/bin/gunicorn -k eventlet -w 1 websocket_server:app -b 0.0.0.0:8283

