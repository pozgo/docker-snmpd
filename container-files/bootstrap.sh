#!/bin/sh

set -u

# Env update
if [ "$SERVER_IP" != "127.0.0.1" ]; then
    sed -i 's|rocommunity public 127.0.0.1|rocommunity public '$SERVER_IP'|g' /etc/snmp/snmpd.conf
fi
if [ "$LOCATION" != "Office"  ]; then
    sed -i 's|syslocation Office|syslocation '$LOCATION'|g' /etc/snmp/snmpd.conf
fi
if [ "$ADMIN_EMAIL" != "sysadmin@email.com" ]; then
    sed -i 's|syscontact Sysadmin (sysadmin@email.com)|syscontact Sysadmin ('$ADMIN_EMAIL') |g' /etc/snmp/snmpd.conf
fi

# User params
USER_PARAMS=$@

# Internal params
RUN_CMD="snmpd -f ${USER_PARAMS}"

#######################################
# Echo/log function
# Arguments:
#   String: value to log
#######################################
log() {
  if [[ "$@" ]]; then echo "[`date +'%Y-%m-%d %T'`] $@";
  else echo; fi
}

# Launch
log $RUN_CMD
$RUN_CMD

# Exit immidiately in case of any errors or when we have interactive terminal
if [[ $? != 0 ]] || test -t 0; then exit $?; fi
log