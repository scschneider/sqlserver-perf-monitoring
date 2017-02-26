FROM phusion/baseimage:0.9.19
MAINTAINER Steven Schneider <stschn@microsoft.com>

RUN apt-get update &&\
    apt-get -y upgrade
RUN curl -sL https://repos.influxdata.com/influxdb.key | apt-key add -
RUN /bin/bash -c "source /etc/lsb-release"

RUN mkdir -p /opt/collectd/share/collectd
RUN curl -o /opt/collectd/share/collectd/types.db https://raw.githubusercontent.com/collectd/collectd/master/src/types.db

RUN apt-get update &&\
    apt-get install -y influxdb
    
ADD influxdb.conf /etc/influxdb/influxdb-template.conf

ENV INFLUXDB_DATA_DIRECTORY /host/influxdb
ENV INFLUXDB_META_DATA_DIRECTORY /host/influxdb
ENV INFLUXDB_WAL_DATA_DIRECTORY /host/influxdb
ENV INFLUXDB_HH_DATA_DIRECTORY /host/influxdb

ENV INFLUXDB_COLLECTD_LISTEN_PORT 25826

RUN mkdir -p /etc/service/influxdb
ADD run-influxdb.sh /etc/service/influxdb/run
RUN chmod +x /etc/service/influxdb/run

ENV HOME /root
CMD ["/sbin/my_init"]
