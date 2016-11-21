FROM ubuntu:16.04
MAINTAINER rusetskialexander@gmail.com

COPY sources/Data_Optimization_Prototype /Data_Optimization_Prototype
COPY sources/venv /venv

RUN adduser dop --shell /bin/bash --disabled-password --gecos "" && chown dop:dop /var/log -R
	#Install required packages

RUN apt-get update &&\
  apt-get install -y git\  
  supervisor\
  curl\
  python\
  python-virtualenv\
  build-essential\
  libssl-dev\
  libkrb5-dev\
  gcc\
  git\
  libmysqlclient-dev \
  mysql-client \
  python-dev libffi-dev \
  libkyotocabinet-dev \
  libxml2-dev \
  libxslt1-dev\
  nginx\
  vim
	
# Add ssh key for github, and clone repo 
#ADD github.key /github
#RUN mkdir -p /root/.ssh && chmod 600 /github && ls -alh /root && pwd
#COPY ssh_config /root/.ssh/config
#RUN echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config &&\
#  git clone git@github.com:broadlook-technologies/Data_Optimization_Prototype.git

#COPY sources/Data_Optimization_Prototype /Data_Optimization_Prototype
#COPY sources/venv /venv

#Create virtual environment
ENV VENV /venv
RUN virtualenv --python=python2.7 $VENV
RUN $VENV/bin/pip install -r /Data_Optimization_Prototype/requirements.txt

COPY react/nvm_install.sh /nvm_install.sh
WORKDIR /Data_Optimization_Prototype/react

        # Install nvm with node and npm
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 6.7.0 #0.12.16

#COPY  websockets/webpack.config.js /Data_Optimization_Prototype/react/webpack.config.js

##RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash \
RUN bash /nvm_install.sh \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default\
    && rm -rf ~/.node-gyp\
    && npm cache clear\
    && npm install\
    && npm install react-tipsy\
    && npm run build-amazon

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH


WORKDIR /Data_Optimization_Prototype/

RUN mkdir -p  /Data_Optimization_Prototype/www/static\
  && mkdir -p /var/log/ringlead
  
COPY configs/supervisor/supervisord.conf /etc/supervisor/supervisord.conf
COPY configs/supervisor/dop.conf /etc/supervisor/conf.d/dop.conf

RUN . /venv/bin/activate; python manage.py collectstatic -lc --noinput

RUN echo '' > /var/log/app.log\
   && chown dop:dop /var/log -R\
   && mkdir /app\
   && chown dop:dop /Data_Optimization_Prototype -R

COPY  all.sh /app/all.sh
