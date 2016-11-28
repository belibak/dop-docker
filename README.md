# dop-docker
##### How to install docker - http://docs-stage.docker.com/engine/installation/
##### To install docker-compose - ```pip install docker-compose```

#### Clone the dop repo into sources directory
```cd dop-docker/sources && git clone dop.git```

### Configs

* Nginx (configs/nginx/nginx.conf):
  * If websockets server runs at rmote server  - ```set $wsIp http://212.212.212.212:8283;```
  * if runs locally from docker-compose - ```set $wsIp http://websockets:8283;```

* Websockets (configs/websockets):
In webpack.config.js: in case2 section ```'SOCKET_IP': JSON.stringify('domain.do')``` domain.do or ip must be visible  from your browser.
In websockets.conf.py : ```WS_SERVER_IP = '192.168.254.254'``` if runs locally from docker-compose - set ```WS_SERVER_IP = 'websockets'```

#### Credentials

* Copy or move creds-examples to creds ```cp -r creds-examples creds```

* creds/  directory must include  ```local_settings.py``` file
```BROKER_URL = 'amqp://user:passwd@rabbit:5672//'``` if runs locally, user and passwd from creds/rabbitmq/creds.env
* creds/salesforce must include  ```local_settings.py``` file

* In creds/rabbitmq/creds.env need to set ``` RABBITMQ_DEFAULT_USER=dop
RABBITMQ_DEFAULT_PASS=dop``` user and password to be used by RabbitMQ server.

* creds/mysql/mysql.env same as rabbitmq

### Build

```
cd dop-docker
```
* build cluster
```
./build.sh
docker-compose up
```

* build part of cluster
```docker-compose build celery``` websockets, web, rabbit, mysql.

### RUN

* ```docker-compose up -d``` or ```docker-compose up -d web``` celery, mysql etc.

* Migrations:
  * ```docker -ti dop-web /bin/bash```  
  * ``` /venv/bin/python manage.py migrate```
  * ```exit```

### Delete all images and containers
```./rm-containers.sh```
