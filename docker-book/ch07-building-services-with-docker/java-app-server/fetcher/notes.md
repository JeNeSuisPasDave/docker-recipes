## installing wget ... packages

```nohighlight
Step 5 : RUN apt-get -yqq install wget
 ---> Running in 0b699317aeb2
Preconfiguring packages ...
Selecting previously unselected package libidn11:amd64.
(Reading database ... 11558 files and directories currently installed.)
Preparing to unpack .../libidn11_1.28-1ubuntu2_amd64.deb ...
Unpacking libidn11:amd64 (1.28-1ubuntu2) ...
Selecting previously unselected package openssl.
Preparing to unpack .../openssl_1.0.1f-1ubuntu2.19_amd64.deb ...
Unpacking openssl (1.0.1f-1ubuntu2.19) ...
Selecting previously unselected package ca-certificates.
Preparing to unpack .../ca-certificates_20160104ubuntu0.14.04.1_all.deb ...
Unpacking ca-certificates (20160104ubuntu0.14.04.1) ...
Selecting previously unselected package wget.
Preparing to unpack .../wget_1.15-1ubuntu1.14.04.1_amd64.deb ...
Unpacking wget (1.15-1ubuntu1.14.04.1) ...
Setting up libidn11:amd64 (1.28-1ubuntu2) ...
Setting up openssl (1.0.1f-1ubuntu2.19) ...
Setting up ca-certificates (20160104ubuntu0.14.04.1) ...
Setting up wget (1.15-1ubuntu1.14.04.1) ...
Processing triggers for libc-bin (2.19-0ubuntu6.9) ...
Processing triggers for ca-certificates (20160104ubuntu0.14.04.1) ...
Updating certificates in /etc/ssl/certs... 173 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d....done.
 ---> bc631e774462
Removing intermediate container 0b699317aeb2
```
