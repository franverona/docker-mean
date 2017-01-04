# We are going to use Ubuntu 16.04
FROM ubuntu:16.04
MAINTAINER Fran Verona

LABEL Description="Dockerfile for MEAN stack"

# We need to expose ports for MEAN. MongoDB (27017) and Node.js (3000)
EXPOSE 3000 27017

# Install prerequisites
RUN apt-get -q update && apt-get install -y -qq \
  git \
  curl \
  ssh \
  gcc \
  make \
  build-essential \
  sudo apt-utils \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - \
  && apt-get install -y -q nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install bower and gulp globally
RUN npm install --quiet -g bower gulp \
  && npm cache clean

# MongoDB will run from a separate official container called 'mongo' (https://hub.docker.com/_/mongo/).
# See the README for more information
