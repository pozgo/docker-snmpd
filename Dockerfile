FROM polinux/centos7:latest
MAINTAINER Przemyslaw Ozgo <linux@ozgo.info>

RUN yum install -y net-snmp && \
yum clean all

ADD config/ /data/config

RUN mv /data/config/snmpd.conf /etc/snmp/snmpd.conf

ADD supervisord.conf /etc/supervisord.d/services.conf

EXPOSE 161