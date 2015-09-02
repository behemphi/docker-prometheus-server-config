# There is no need for any sort of "smarts" to this container
# so using scratch to keep it as small as possible.
FROM scratch
MAINTAINER Boyd Hemphill <boyd@stackengine.com>

# Place the configuration file witin the container
ADD config.yml /stackengine/prom-config.yml

# A binary for an infinite loop
ADD buildoutput/prom-forever /prom-forever

# Need it to run indefinitely
ENTRYPOINT ["/prom-forever"]
