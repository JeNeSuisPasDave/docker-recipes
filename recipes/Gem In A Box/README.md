# Gem In A Box

This Docker recipe extends a Ruby container with a data volume and `geminabox` to host a local gem source. As described in the [RubyGems Guide][diy], the [Gem in a Box][giab] software project provides a way of providing a web hosted gem source.

[diy]: http://guides.rubygems.org/run-your-own-gem-server/
[giab]: https://github.com/geminabox/geminabox

## A safe way of persisting data volumes

As OS X and Windows do not directly provide containers, the Docker host is a Linux VM created using `docker-machine` and a `boot2docker` ISO, both available as part of the Docker Toolbox.

The boot2docker ISO might get updated or upgraded, or perhaps replaced with some other suitable distribution. The containers can be recreated via `docker build`, but persisted data cannot.

To keep data volumes from being lost in the move to a new machine we can map them to a path on a second virtual store (e.g. VHD or VMDK device) that we just detach from the old Docker host VM and attach to the new host VM.

The file `data-drive-setup.md` describes how to create a second virtual drive onto which data volumes can be mapped. The remainder of this document assumes that such a "data drive" exists, and is persisting anything written under the host file path `/var/lib/dockerdata`.

## Building the geminabox server container

[Gem In A Box][giab] is both a [Ruby][ruby] web application, hosted using [Rack][rack], [Sinatra][sinatra], and the builtin [WEBRick][webrick] server. It comes with a sample Dockerfile that can be used as a starting point for creating a container to run the `geminabox` server.

[ruby]: https://www.ruby-lang.org/en/
[rack]: https://github.com/rack/rack
[sinatra]: https://github.com/sinatra/sinatra
[webrick]: http://ruby-doc.org/stdlib-2.3.1/libdoc/webrick/rdoc/index.html

I've updated the Dockerfile a bit to support deployment from both an OS X and a Windows 10 host. It has four sections:

* specifying the base image
* setting up the working directory
* installing `geminabox`---copying the source code to the server and installing the antecedent gems
* exposing the web service port and starting the web application

It looks like this:

```nohighlight
FROM ruby:2.3

MAINTAINER  Dave Hein <dhein@acm.org>

# To void the cache beyond the base image, change REFRESHED_AT to current time
#
ENV REFRESHED_AT 2016-05-12T04:27-0500
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV BUNDLE_AT 2016-05-12T12:29-0500
# Install the antecedent gems
#
COPY geminabox/ /usr/src/app
#
# Fix file permissions because we are copying from Windows
#
COPY fix-permissions.sh /usr/src/app
RUN chmod 744 fix-permissions.sh
RUN ./fix-permissions.sh
#
RUN bundle install
RUN bundle config --global frozen 1

ENV GEMINABOX_AT 2016-05-12T04:27-0500
# ########################################
# These commands are from the geminabox Dockerfile
#
# RUN mkdir data
EXPOSE 9292
ENTRYPOINT ["rackup", "--host", "0.0.0.0"]
```

Note the use of the `fix-permissions.sh` script. This is necessary because the windows Docker client will set all permissions to '`-rwxr-xr-x`' (o766) for all files COPY-ed into the image. If you aren't dealing with Windows, then execution of that script that can be removed from the Dockerfile.

Build the image with:

```bash
docker build -t datihein/geminabox:v0.13.1 .
```

## Starting the container

On OS X using bash, run the container with:

```bash
docker run -d -p 9292:9292 \
  -v /var/lib/dockerdata/geminabox/data:/usr/src/app/data \
  datihein/geminabox:v0.13.1
```

or on Windows 10 using Powershell, run the container with

```powershell
& docker run -d -p 9292:9292 `
  -v /var/lib/dockerdata/geminabox/data:/usr/src/app/data `
  datihein/geminabox:v0.13.1
```

You can check that it is running by pointing your browser to the URL `http://<dockerip>:9292`, where `<dockerip>` is whatever `docker-machine ip` returns. For example, `http://192.168.99.100:9292`.

## Client setup

To setup the client I created a Ruby virtual environment in a `client` subdirectory. I used Ruby 2.0.0p598, and I updated rubygems to 2.0.17.

I simply installed the `geminabox` gem into that virtual environment using `bundle install`. The Gemfile looks like:

```nohighlight
source "https://rubygems.org"

gem 'geminabox', '0.13.1'
```

Once that is done, the `inabox` command is plugged into `gem`. You can do `gem inabox --help` to see the options.

I configured the connection to the `geminabox` web app by doing `gem inabox -c` and supplying the URL `http://192.168.99.100:9292`; you'd use whatever IP your docker VM has.

## Pushing gems

Then I downloaded, from [rubygems.org](https://rubygems.org/gems/rdoc/versions/4.2.1) a gem that I wanted to provide via the `geminabox` server and I pushed it up to the server by doing `gem inabox ~/Downloads/rdoc-4.2.1.gem`

## Using the geminabox source

You can add the `geminabox` server to your gem sources with the command `gem sources --add http://192.168.99.100:9292`.

If you want to use that source exclusively then you'll need to remove rubygems.org with the command `gem sources --remove https://rubygems.org/`.
