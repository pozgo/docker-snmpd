FROM centos:centos7
MAINTAINER Przemyslaw Ozgo <linux@ozgo.info>

RUN \
    yum update -y && \
    yum install -y net-snmp && \
    yum clean all

COPY container-files /

ENV SERVER_IP=127.0.0.1 LOCATION=Office ADMIN_EMAIL=sysadmin@email.com

EXPOSE 161

ENTRYPOINT ["/bootstrap.sh"]