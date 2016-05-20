#! /bin/sh
#

# Make subdirectories
#
mkdir -p certs crl csr newcerts private

# Generate a new key file
#
if test -f private/${CERTNAME}.key.pem ; then
  chmod 600 private/${CERTNAME}.key.pem
fi
openssl genrsa -out private/${CERTNAME}.key.pem 2048 && \
  chmod 400 private/${CERTNAME}.key.pem

# Generate the csr
#
openssl req -config openssl.cnf -new -sha256 \
  -key private/${CERTNAME}.key.pem \
  -out csr/${CERTNAME}.csr.pem

# Verify CSR
#
openssl req -noout -text \
  -in csr/${CERTNAME}.csr.pem
