# about ../tmp directory

Many of these recipes will contain Dockerfiles that download large files using curl or wget. Rather than downloading those files each time the image is built, I have stored a local copy in `../tmp`.

Here is the list of files in `../tmp`:

## boot2docker-1.12.2-bash.iso

Tryng to make a boot2docker with bash ... not yet successful.

## gpg-trust.sh

Expect script that will add trust of an imported key to GPG

```bash
#! /usr/bin/expect

set timeout 10

spawn /usr/bin/gpg --edit-key $argv 0 --yes trust quit

expect "Your decision? " { send "5\r" }
expect "Do you really want to set this key to ultimate trust? (y/N) " { send "y\r" }

interact
```

## nginx-1.11.5.tar.gz

Nginx source tarball, suitable for building nginx.

```bash
curl -fSL http://nginx.org/download/nginx-1.11.5.tar.gz -o nginx.tar.gz
```

## nginx-1.11.5.tar.gz.asc

GPG signature for nginx source tarball.

```bash
curl -fSL http://nginx.org/download/nginx-1.11.5.tar.gz.asc -o nginx.tar.gz.asc
```

## nginx-gpg.key

Public key of keypair used to sign the nginx 1.11.5 source tarball.

Go to [http://ha.pool.sks-keyservers.net](http://ha.pool.sks-keyservers.net) and search for `0xB0F4253373F8F6F510D42178520A9993A1C052F8`. Then download the public key.

Alternatively, download [http://ha.pool.sks-keyservers.net/pks/lookup?op=get&search=0x520A9993A1C052F8](http://ha.pool.sks-keyservers.net/pks/lookup?op=get&search=0x520A9993A1C052F8)

## python-3.5.2.tar.xz

Python source tarball.

```bash
wget -O python.tar.xz "https://www.python.org/ftp/python/3.5.2/Python-$PYTHON_VERSION.tar.xz"
```

## python-3.5.2.tar.xz.asc

GPG signature for python source tarball.

```bash
wget -O python.tar.xz.asc "https://www.python.org/ftp/python/3.5.2/Python-$PYTHON_VERSION.tar.xz.asc"
```

## python3-gpg.key

Public key of keypair used to sign the python 3.5.2 source tarball.

Go to [http://ha.pool.sks-keyservers.net](http://ha.pool.sks-keyservers.net) and search for `97FC712E4C024BBEA48A61ED3A5CA953F73C700D`. Then download the public key.

Alternatively, download [http://ha.pool.sks-keyservers.net/pks/lookup?op=get&search=0x3A5CA953F73C700D](http://ha.pool.sks-keyservers.net/pks/lookup?op=get&search=0x3A5CA953F73C700D)
