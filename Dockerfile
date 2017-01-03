# We are going to use Ubuntu 16.04
FROM ubuntu:16.04
MAINTAINER Fran Verona

LABEL Description="Dockerfile for MEAN stack"

# We need to expose ports for MEAN. MongoDB (27017) and Node.js (3000)
EXPOSE 3000 27017

# Install prerequisites
RUN apt-get -q update \
  && apt-get install -y -qq git curl ssh gcc make build-essential sudo apt-utils \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install MongoDB (we are using SysV init solution because of Docker)
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 \
  && echo "deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list \
  && apt-get -q update \
  && apt-get install -y -q mongodb-org \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Init MongoDB service
RUN service mongod restart

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - \
  && apt-get install -y -q build-essential nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Node.js | Install bower and gulp globally
RUN npm install --quiet -g bower gulp \
  && npm cache clean
