# 本体
#
# VERSION               0.0.1

FROM      gendosu/ubuntu-base:latest

MAINTAINER Gen Takahashi "gendosu@gmail.com"

RUN apt-get update \
&&  apt-get -y upgrade \
&&  apt-get -y --force-yes install \
    zip \
&&  apt-get clean \
&&  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN wget https://releases.hashicorp.com/consul/0.6.3/consul_0.6.3_linux_amd64.zip
RUN unzip consul_0.6.3_linux_amd64.zip
RUN mv consul /usr/local/bin

# RUN mkdir -p /products
# WORKDIR /products

# ADD Gemfile /products/Gemfile
# ADD Gemfile.lock /products/Gemfile.lock
#
# RUN eval "$(rbenv init -)"; bundle
