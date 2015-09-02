# Purpose

This repository works in support of the 
[`behemphi/docker-prometheus-server`](https://github.com/behemphi/docker-prometheus-server) repo.
It provides a dedicated, always running, container to persist the volatile 
Prometheus configuration file. 

# Usage

Running this container is trival, but also very uninteresting without the use
of the Prometheus server.

## With `docker run`

Note that the name of the container is important when mounting it to a 
Prometheus server container later.

```
docker run \
  --detach \
  --name prom-server-config \
  --restart=always \
  --volume /stackengine \
  behemphi/prom-server-config
```

## As a `docker-compose` Service

Be sure the name of the service (not the container) is a direct match for
with the service named in the `volumes_from:` parameter of the Prometheus 
server.

```YAML
prom-server-config: 
    container_name: prom-server-config
    image: behemphi/prom-server-config
    restart: always 
    volumes:
        - /stackengine
```

# Warnings

While it is perfectly valid to have stopped container as a dedicated data
container, this comes with certain problems.

This container is designed to _always be running_ so that a reaping process does
not remove it inadvertantly.

# Use Cases

See [`behemphi/docker-prometheus-server`](https://github.com/behemphi/docker-prometheus-server).

# Trivia

Note the use of the `scratch` base container in the Dockerfile. This is a great
way to build tiny containers when you have the luxury of working with 
staticly compiled binaries.  In this case we have a trivial Golang `for` loop.

# License

MIT