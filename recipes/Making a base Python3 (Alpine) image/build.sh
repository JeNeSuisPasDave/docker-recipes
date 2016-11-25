#! /bin/bash
#
docker build \
  --tag datihein/python3.5:alpine --tag datihein/python3.5.2:alpine .

#! /bin/bash
#

function do_it() {
  docker build \
    --tag datihein/python-alpine:3.5 --tag datihein/python-alpine:3.5.2 .
}

mkdir tmp
cp ../../tmp/python-3.5.2.* tmp
cp ../../tmp/gpg-trust.sh tmp
cp ../../tmp/python3-gpg.key tmp

ls tmp

do_it
rc_=$?

rm -r tmp
exit $rc_

