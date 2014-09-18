FROM polinux/centos7:latest
MAINTAINER Przemyslaw Ozgo <linux@ozgo.info>

ENV SERVER_IP 127.0.0.1
ENV LOCATION Office
ENV ADMIN_EMAIL sysadmin@email.com

RUN yum update -y && \
yum install -y net-snmp && \
yum clean all

ADD snmpd.conf /etc/snmp/snmpd.conf
ADD init/env.sh /config/init/env.sh
ADD supervisord.conf /etc/supervisord.d/supervisord-snmpd.conf

EXPOSE 161

CMD ["/config/bootstrap.sh"]