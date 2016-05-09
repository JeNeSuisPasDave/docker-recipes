# Docker Demo - simple web app

This is an example showing how to run a simple web app in a docker environment.

## Source of example

This is replicated from an example by Dr John Lees-Miller. See these slides:
[http://jdlm.info/ds-docker-demo](http://jdlm.info/ds-docker-demo); see this example code [https://github.com/jdleesmiller/ds-docker-demo](https://github.com/jdleesmiller/ds-docker-demo).

## Building the container

We build the container image using the Dockerfile.

```powershell
docker build --tag hello_world .
```

## Running the container

We can launch the container with

```powershell
docker run -i -t --rm --publish 3000:8000 hello_world ruby /app/hello_world.rb
```

`3000` is the public port on the Docker host VM. So we can browse to the web page presented by the container with URL `http://192.168.99.100:3000/`, where the IP would be the IP of the VM host (in this example, `192.168.99.100`).
