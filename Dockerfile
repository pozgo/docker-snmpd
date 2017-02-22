FROM alpine:latest

RUN \
  apk add --update net-snmp net-snmp-tools && \
  rm -rf /var/cache/apk/* && \
  sed -i 's/agentAddress  udp:127.0.0.1:161/agentAddress  udp:0.0.0.0:161/g' /etc/snmp/snmpd.conf

COPY container-files /

EXPOSE 161

ENTRYPOINT ["/bootstrap.sh"]
