## NET-SNMP Daemon

[![CircleCI Build Status](https://img.shields.io/circleci/project/pozgo/docker-snmpd/master.svg)](https://circleci.com/gh/pozgo/docker-snmpd) [![](https://images.microbadger.com/badges/image/polinux/snmpd:latest.svg)](http://microbadger.com/images/polinux/snmpd) `master`  
[![CircleCI Build Status](https://img.shields.io/circleci/project/pozgo/docker-snmpd/alpine.svg)](https://circleci.com/gh/pozgo/docker-snmpd) [![](https://images.microbadger.com/badges/image/polinux/snmpd:alpine.svg)](http://microbadger.com/images/polinux/snmpd) `alpine`  
[![GitHub Open Issues](https://img.shields.io/github/issues/pozgo/docker-snmpd.svg)](https://github.com/pozgo/docker-snmpd/issues)
[![GitHub Stars](https://img.shields.io/github/stars/pozgo/docker-snmpd.svg)](https://github.com/pozgo/docker-snmpd)
[![GitHub Forks](https://img.shields.io/github/forks/pozgo/docker-snmpd.svg)](https://github.com/pozgo/docker-snmpd)  
[![Stars on Docker Hub](https://img.shields.io/docker/stars/polinux/snmpd.svg)](https://hub.docker.com/r/polinux/snmpd)
[![Pulls on Docker Hub](https://img.shields.io/docker/pulls/polinux/snmpd.svg)](https://hub.docker.com/r/polinux/snmpd)  
[![](https://images.microbadger.com/badges/version/polinux/snmpd.svg)](http://microbadger.com/images/polinux/snmpd)
[![](https://images.microbadger.com/badges/license/polinux/snmpd.svg)](http://microbadger.com/images/polinux/snmpd)

[![Deploy to Docker Cloud](https://files.cloud.docker.com/images/deploy-to-dockercloud.svg)](https://cloud.docker.com/stack/deploy/?repo=https://github.com/pozgo/docker-snmpd/tree/master)

This is polinux/snmpd docker image with snmpd daemon running in foreground and based on offcial CentOS-7 and offers ability to provide any argument to snmpd process.

**For super small image use tag `alpine`**

This container is built that any extra parameters provided to docker run will be passed directly to snmpd command. For example, if you run docker `run [options] polinux/snmpd -c FILE` you pass `-c FILE` to snmpd daemon.

## Usage
### Basic

    docker run \
    -d \
    --name snmpd \
    -p 161:161/udp \
    polinux/snmpd
    
### Basic `alpine`

    docker run \
    -d \
    --name snmpd \
    -p 161:161/udp \
    polinux/snmpd:alpine

### Mount custom config , override some options
Using custom config file:

    docker run \
    -d \
    --name snmpd \
    -p 161:161/udp \
    -v /my-snmpd.conf:/etc/snmpd/snmpd.conf \
    polinux/snmpd \
    -c /etc/snmpd/snmod.conf
    
Alpine 

    docker run \
    -d \
    --name snmpd \
    -p 161:161/udp \
    -v /my-snmpd.conf:/etc/snmpd/snmpd.conf \
    polinux/snmpd:alpine \
    -c /etc/snmpd/snmod.conf

### SNMPD CMD params
`snmpd` command can be used with some parameters to define monitoring server address and other parameters. Simple --help output below:

**`-f` (foregroud) used as default in this image**

    Usage:  snmpd [OPTIONS] [LISTENING ADDRESSES]

            Version:  5.7.3
            Web:      http://www.net-snmp.org/
            Email:    net-snmp-coders@lists.sourceforge.net

      -a                    log addresses
      -A                    append to the logfile rather than truncating it
      -c FILE[,...]         read FILE(s) as configuration file(s)
      -C                    do not read the default configuration files
                              (config search path: /etc/snmp:/usr/share/snmp:/usr/lib/snmp:/root/.snmp)
      -d                    dump sent and received SNMP packets
      -D[TOKEN[,...]]       turn on debugging output for the given TOKEN(s)
                              (try ALL for extremely verbose output)
                              Don't put space(s) between -D and TOKEN(s).
      -f                    do not fork from the shell
      -g GID                change to this numeric gid after opening
                              transport endpoints
      -h, --help            display this usage message
      -H                    display configuration file directives understood
      -I [-]INITLIST        list of mib modules to initialize (or not)
                              (run snmpd with -Dmib_init for a list)
      -L <LOGOPTS>          toggle options controlling where to log to
            e:           log to standard error
            o:           log to standard output
            n:           don't log at all
            f file:      log to the specified file
            s facility:  log to syslog (via the specified facility)

            (variants)
            [EON] pri:   log to standard error, output or /dev/null for level 'pri' and above
            [EON] p1-p2: log to standard error, output or /dev/null for levels 'p1' to 'p2'
            [FS] pri token:    log to file/syslog for level 'pri' and above
            [FS] p1-p2 token:  log to file/syslog for levels 'p1' to 'p2'
      -m MIBLIST            use MIBLIST instead of the default MIB list
      -M DIRLIST            use DIRLIST as the list of locations to look for MIBs
                              (default $HOME/.snmp/mibs:/usr/share/snmp/mibs)
      -p FILE               store process id in FILE
      -q                    print information in a more parsable format
      -r                    do not exit if files only accessible to root
                              cannot be opened
      -u UID                change to this uid (numeric or textual) after
                              opening transport endpoints
      -v, --version         display version information
      -V                    verbose display
      -x ADDRESS            use ADDRESS as AgentX address
      -X                    run as an AgentX subagent rather than as an
                              SNMP master agent

    Deprecated options:
      -l FILE               use -Lf <FILE> instead
      -P                    use -p instead
      -s                    use -Lsd instead
      -S d|i|0-7            use -Ls <facility> instead
