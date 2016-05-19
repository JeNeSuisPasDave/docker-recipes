# Very small Docker image that runs openssl to create a CA certificate
#
FROM datihein/openssl
MAINTAINER Dave Hein <dhein@acm.org>

ARG REFRESHED_AT=2016-05-17T19:27-0500
WORKDIR /data/root/ca

#ARG CMD_AT=2016-05-17T19:42-0500 
#CMD mkdir -p certs crl newcerts private && \
#    expect -c "spawn openssl genrsa -aes256 -out private/${KEY_NAME}.key.pem 4096" \
#    -c "expect \"Enter pass phrase\"" \
#    -c "send \"${PP_}\r\"" \
#    -c "expect \"Verifying - Enter pass phrase\"" \ 
#    -c "send \"${PP_}\r\"" \
#    -c "wait" && \
#    echo
#
#CMD /usr/bin/openssl genrsa -out /certs/${KEY_NAME}.key 1024 && \
#   /usr/bin/openssl req  -new -newkey rsa:4096 -days 365 -nodes -subj "/C=/ST=/L=/O=/CN=${COMMON_NAME}" -keyout /certs/${KEY_NAME}.key -out /certs/${KEY_NAME}.csr  && \
#    /usr/bin/openssl x509 -req -days 365 -in /certs/${KEY_NAME}.csr -signkey /certs/${KEY_NAME}.key -out /certs/${KEY_NAME}.crt
