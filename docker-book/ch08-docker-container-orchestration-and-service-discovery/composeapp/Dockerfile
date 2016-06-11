FROM python:2.7
MAINTAINER James Turnbull <james@example.com>
ENV REFRESHED_AT 2014-08-01

COPY app.py requirements.txt /composeapp/

WORKDIR /composeapp

RUN pip install -r requirements.txt
