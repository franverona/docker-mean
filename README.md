## Dockerfile for MEAN stack

### Prerequisites
- [Docker](https://www.docker.com/)

### Build

Build Docker container using `docker build`:

```
docker build -t mean - < Dockerfile 
```

`mean` tag can be changed if you want a more descriptive tag container.

### Run

Create a network between your container and your host first using `docker network`:

```
docker network create --subnet=192.168.10.0/24 dockernet
```

Where `192.168.10.0` is a private network ([reserved private space address](https://en.wikipedia.org/wiki/Private_network#Private_IPv4_address_spaces)) and `dockernet` is the same of our new interface (can be different).

Run Docker container using `docker run` by assigning an IP to our container inside our recently created network:

```
docker run --net dockernet --ip 192.168.10.22 -it -p 3000:3000 -p 27017:27017 mean
```

We have to expose ports again because we want to access to our container from outside Docker. Ports were mapped to the same ports from Docker container to host machine. Map your ports properly according to your own configuration.

### Related links
- [How to Install MEAN on Ubuntu 16.04](https://linuxacademy.com/howtoguides/posts/show/topic/11960-how-to-install-mean-on-ubuntu-1604)
