#! /bin/bash
#

function do_it() {
  docker build \
    --tag datihein/nginx-alpine:1.11.5 --tag datihein/nginx-alpine:latest .
}

mkdir tmp
cp ../../tmp/nginx-1.11.5.* tmp
cp ../../tmp/gpg-trust.sh tmp
cp ../../tmp/nginx-gpg.key tmp

ls tmp

do_it
rc_=$?

rm -r tmp
exit $rc_

