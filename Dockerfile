# We are going to use Ubuntu 16.04
FROM ubuntu:14.04
MAINTAINER Fran Verona

LABEL Description="Dockerfile for MEAN stack"

# We need to expose ports for MongoDB (27017) and Node.js (3000)
EXPOSE 3000 27017 35729

# Install prerequisites
RUN apt-get -q update && apt-get install -y -qq \
  git \
  curl \
  ssh \
  gcc \
  make \
  build-essential \
  sudo \
  apt-utils \
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

# Let's setup our project. We need to create a working directory first, clone the project and configure it

RUN mkdir -p /usr/src/app
WORKDIR /user/src/app

# Clone Mean.io repository
RUN git clone https://github.com/linnovate/mean.git /user/src/app

# Install server dependencies using npm
RUN npm install --quiet \
  && npm cache clean

# Install client dependencies using bower
RUN bower install --config.interactive=false --quiet --allow-root

# Start the server
CMD ["gulp"]
