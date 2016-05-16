#! /bin/sh
#
for i in $(find . -type f)
  do
    chmod -c 644 $i
  done
