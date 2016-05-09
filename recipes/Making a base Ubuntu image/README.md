# Making a base Ubuntu image

Rather than doing the apt upgrade and update for every Ubuntu-based image I want to build, I'll make an image that include the recent packup updates and use that as a base for other images.

I'll name it `datihein/ubunutu` and tag it `updated` and `14.04.4u`.

Then dependent Dockerfiles can say `FROM datihein/ubuntu:updated`.
