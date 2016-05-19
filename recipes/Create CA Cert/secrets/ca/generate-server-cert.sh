#! /bin/sh
#
mkdir -p intermediate/certs intermediate/crl intermediate/csr
mkdir -p intermediate/newcerts intermediate/private
mkdir -p server/certs

# Create the server certificate, expires in 1 year, 10 days
#
openssl ca -config intermediate/openssl.cnf \
      -extensions server_cert -days 375 -notext -md sha256 \
      -in server/csr/${CERTNAME}.csr.pem \
      -out server/certs/${CERTNAME}.cert.pem
chmod 444 server/certs/${CERTNAME}.cert.pem

# Verify the intermediate certificate
#
openssl x509 -noout -text \
  -in server/certs/${CERTNAME}.cert.pem

# Verify the intermediate certificate against the CA certificate chain
#
openssl verify -CAfile intermediate/certs/ca-chain.cert.pem \
  server/certs/${CERTNAME}.cert.pem
