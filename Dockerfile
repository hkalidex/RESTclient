FROM python:3.6.5-stretch

ENV http_proxy http://proxy-chain.intel.com:911
ENV https_proxy https://proxy-chain.intel.com:911

RUN mkdir /RESTclient

COPY docker /RESTclient/docker

RUN mkdir -p /etc/ssl/certs
RUN cp /RESTclient/docker/cabundle.pem /etc/ssl/certs/cabundle.pem
RUN cp /RESTclient/docker/apt.conf /etc/apt/apt.conf

COPY . /RESTclient/

WORKDIR /RESTclient

RUN ./build.py3.sh venv
RUN pyb install

# ENV http_proxy=
# ENV https_proxy=

WORKDIR /RESTclient
CMD echo 'DONE'
