#! /bin/sh
#
ifconfig eth0 | awk '
  /inet addr/{
    for (i = 1; i < NF; ++i) {
      j = i + 1;
      k = i + 2;
      if ($i ~ /^inet$/) {
        split($j, parts, ":");
        print parts[2];
        break;
      }
    }
  }'
