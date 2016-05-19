#! /bin/sh
#
mkdir -p intermediate/certs intermediate/crl intermediate/csr
mkdir -p intermediate/newcerts intermediate/private

# Create the CSR (certificate signing request)
#
openssl req -config intermediate/openssl.cnf -new -sha256 \
  -key intermediate/private/intermediate.key.pem \
  -out intermediate/csr/intermediate.csr.pem

# Create the intermediate certificate, expires in 4 years, 10 days
#
openssl ca -config openssl.cnf -extensions v3_intermediate_ca \
  -days 1434 -notext -md sha256 \
  -in intermediate/csr/intermediate.csr.pem \
  -out intermediate/certs/intermediate.cert.pem && \
  chmod 444 intermediate/certs/intermediate.cert.pem

# Verify the intermediate certificate
#
openssl x509 -noout -text \
  -in intermediate/certs/intermediate.cert.pem

# Verify the intermediate certificate against the root certificate
#
openssl verify -CAfile certs/ca.cert.pem \
  intermediate/certs/intermediate.cert.pem

# Create the certificate chain
#
cat intermediate/certs/intermediate.cert.pem \
      certs/ca.cert.pem > intermediate/certs/ca-chain.cert.pem
chmod 444 intermediate/certs/ca-chain.cert.pem
