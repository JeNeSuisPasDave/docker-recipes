& docker run --rm `
  -e KEY_NAME=datihein -e PP_="wat dat?!" `
  -v /var/lib/dockerdata/root/ca:/data/root/ca `
  datihein/ca-cert