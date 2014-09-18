#!/bin/sh

sed -i 's|syslocation Office|syslocation '$LOCATION'|g' /etc/snmp/snmpd.conf
sed -i 's|syscontact Sysadmin (sysadmin@email.com)|syscontact Sysadmin ('$ADMIN_EMAIL') |g' /etc/snmp/snmpd.conf
sed -i 's|rocommunity public 127.0.0.1|rocommunity public '$SERVER_IP'|g' /etc/snmp/snmpd.conf