## Dockerfile for MEAN stack

### Prerequisites

If you are using Mac, you can use [Docker for Mac](https://www.docker.com/products/docker#/mac).

If you are using Windows, you can use [Docker for Windows](https://www.docker.com/products/docker#/windows).

If you are using Linux, you have to install Docker manually [following their guide](https://docs.docker.com/engine/installation/linux/).

### Run using Docker Compose

You can use the Docker Compose YAML file to start this Docker container. You have to build it first:

```
docker-composer build
```

Then run it:

```
docker-composer run
```

Now you will have 2 separates containers: one for MongoDB and one for the web itself.

### Run manually

We have to pull MongoDB Docker container first:

```
docker run -p 27017:27017 -d --name db mongo
```

This will run MongoDB container from Docker Hub as a background process (`-d` option) with `db` name and with `27017` port exposed.

After this, we can build our own Docker container:

```
docker run -p 3000:3000 --link db:db_1 mean
```

This will run our own container (which will install prerequisites and Node.js), with `3000` port exposed (used by Node.js by default) and with an special link provided by Docker to our previous MongoDB container.

### Related links
- [How to Install MEAN on Ubuntu 16.04](https://linuxacademy.com/howtoguides/posts/show/topic/11960-how-to-install-mean-on-ubuntu-1604)
