#! /bin/sh
#
mkdir -p intermediate/certs intermediate/crl intermediate/csr
mkdir -p intermediate/newcerts intermediate/private
if test -f intermediate/private/intermediate.key.pem ; then
  chmod 600 intermediate/private/intermediate.key.pem
fi

openssl genrsa -aes256 \
  -out intermediate/private/intermediate.key.pem 4096 && \
  chmod 400 intermediate/private/intermediate.key.pem
