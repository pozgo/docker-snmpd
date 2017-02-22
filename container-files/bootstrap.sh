#!/bin/sh
set -u
USER_PARAMS=$@
snmpd -H
snmpd -v
echo "SNMPD Daemon started..."
snmpd -V -f ${USER_PARAMS}
