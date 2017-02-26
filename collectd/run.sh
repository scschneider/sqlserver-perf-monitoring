#!/bin/bash

#The ip address of the InfluxDB server collecting collectd metrics
INFLUX_DB_SERVER="localhost"

#The port that your InfluxDB is listening for collectd traffic
INFLUX_DB_PORT="25826"

#The host name of the server you are monitoring. This is the value that shows up under hosts on the Grafana dashboard
SQL_HOSTNAME="MyHostName"

#The username used to connect to SQL Server.
SQL_USERNAME="sa"

#The password of the account used to connect to SQL Server
SQL_PASSWORD="sa_password"

#The interval that you would like metrics to be pulld from your SQL Server
SQL_POLL_INTERVAL="1"

sudo docker run -d --privileged --net=host -v /:/host:ro \
        -e "INFLUX_DB_SERVER=$INFLUX_DB_SERVER" -e "INFLUX_DB_PORT=$INFLUX_DB_PORT" \
        -e "SQL_HOSTNAME=$SQL_HOSTNAME" -e "SQL_USERNAME=$SQL_USERNAME" -e "SQL_PASSWORD=$SQL_PASSWORD" -e "SQL_POLL_INTERVAL= $SQL_POLL_INTERVAL" \
        --name collectd scschneider/sqlserver-perf-monitoring-collectd