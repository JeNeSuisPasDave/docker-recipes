#! /bin/sh
#
mkdir -p certs crl newcerts private
if test -f private/ca.key.pem ; then
  chmod 600 private/ca.key.pem
fi
openssl genrsa -aes256 -out private/ca.key.pem 4096 && \
  chmod 400 private/ca.key.pem
