FROM phusion/baseimage:0.9.19
MAINTAINER Steven Schneider <stschn@microsoft.com>

RUN apt-get update &&\
    apt-get -y upgrade
RUN add-apt-repository "deb https://packagecloud.io/grafana/stable/debian/ jessie main"
RUN curl https://packagecloud.io/gpg.key | apt-key add -

RUN apt-get update &&\
    apt-get install -y grafana &&\
    apt-get install -y apt-transport-https

 RUN mkdir -p /etc/service/grafana
 ADD run-grafana.sh /etc/service/grafana/run
 RUN chmod +x /etc/service/grafana/run

ENV HOME /root
CMD ["/sbin/my_init"]
