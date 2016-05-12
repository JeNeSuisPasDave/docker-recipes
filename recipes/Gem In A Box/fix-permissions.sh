#! /bin/bash
#
for i in $(find . -type f)
  do
    chmod -c 644 $i
  done
chmod 755 console.sh