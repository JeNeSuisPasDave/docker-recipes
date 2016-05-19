#! /bin/sh
#
mkdir -p certs crl newcerts private

# Create the root certificate, expires in 20 years
#
openssl req -config openssl.cnf \
  -key private/ca.key.pem \
  -new -x509 -days 7300 -sha256 -extensions v3_ca \
  -out certs/ca.cert.pem && \
  chmod 444 certs/ca.cert.pem

# Verify the root certificate
#
openssl x509 -noout -text -in certs/ca.cert.pem
