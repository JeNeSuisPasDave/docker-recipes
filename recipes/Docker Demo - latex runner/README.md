# Docker Demo - latex runner

This is an example showing how to run a build tool (e.g. a compiler) in a docker environment. In this example we run `pdflatex` to compile a LaTex input file into a formatted PDF document.

## Source of example

This is replicated from an example by Dr John Lees-Miller. See these slides:
[http://jdlm.info/ds-docker-demo](http://jdlm.info/ds-docker-demo); see this example code [https://github.com/jdleesmiller/ds-docker-demo](https://github.com/jdleesmiller/ds-docker-demo).

## Building the container

We build the container image using the Dockerfile.

```bash
docker build --tag texlive .
```

## Running the container

We run the container with this `bash` command:

```bash
docker run -i -t --rm --volume "`pwd`":/tmp texlive pdflatex main
```

The `--volume` argument maps a local directory to a mount point in the container. In this case it is mapping the current local directory, specified as `"`pwd`"`, to a container mount point of `/tmp`. In the `Dockerfile` that mount point was set as the current directory, the working directory, of the running container via the config line:

```nohighlight
WORKDIR /tmp
```

## Using a non-privileged user

By default containers use an administrative user, typically named `docker` and belonging to the group `docker`. This account has root privileges and can do anything in the running container.

It is a best practice to run as a non-privileged user. Such a user needs to be created when the image is built (so that it is available when the container is launched). We do that here with the `Dockerfile` specifications:

```nohighlight
# Create a user to run the texlive toolchain
#
RUN useradd -m -s /bin/bash texxie
USER texxie
WORKDIR /home/texxie
```
