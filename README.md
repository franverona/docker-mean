## Dockerfile for MEAN stack

This Dockerfile will create a working Docker environment using [Mean.io](http://mean.io/) boilerplate.

### Prerequisites

* If you are using Mac, you can use [Docker for Mac](https://www.docker.com/products/docker#/mac).
* If you are using Windows, you can use [Docker for Windows](https://www.docker.com/products/docker#/windows).
* If you are using Linux, you have to install Docker manually [following their guide](https://docs.docker.com/engine/installation/linux/).

### TL;DR
```
# Pull Mongo image from DockerHub and start it
docker pull mongo
docker run -p 27017:27017 -d --name db mongo

# Build MEAN image and run it
docker build -t mean .
docker run -p 3000:3000 -p 35729:35729 --name mean --link db:db mean
```

### Run manually

We have to pull MongoDB Docker container first:

```
docker pull mongo
```

Then we can run it using:

```
docker run -p 27017:27017 -d --name db mongo
```

This will run MongoDB container from Docker Hub as a background process (`-d` option) with `db` name and with port `27017` exposed. Now we have to build our own image:

```
docker build -t mean .
```

This will build a Docker image using current repository. After this, we can run our own Docker container:

```
docker run -p 3000:3000 -p 35729:35729 --name mean --link db:db mean
```

This will run our own container (which will install prerequisites and Node.js), with ports `3000` (Node.js), `27017` (MongoDB) and `35729` (LiveReload) exposed; a link between our image and MongoDB image will be created using `--link` option.

### Related links
- [How to Install MEAN on Ubuntu 16.04](https://linuxacademy.com/howtoguides/posts/show/topic/11960-how-to-install-mean-on-ubuntu-1604)
