# 本体
#
# VERSION               0.0.1

FROM      gendosu/ubuntu-base:latest

MAINTAINER Gen Takahashi "gendosu@gmail.com"

RUN apt-get update \
&&  apt-get -y upgrade \
&&  apt-get -y --force-yes install \
    zip \
    nginx \
    supervisor \
    dnsmasq \
    dnsutils \
    jq \
&&  apt-get clean \
&&  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN wget https://releases.hashicorp.com/consul/0.6.3/consul_0.6.3_linux_amd64.zip \
&&  unzip consul_0.6.3_linux_amd64.zip \
&&  mv consul /usr/local/bin \
&&  rm consul_0.6.3_linux_amd64.zip \
&&  mkdir -p /etc/consul.d \
&&  mkdir -p /var/log/consul

ADD stretcher /usr/local/bin
