##NET-SNMP Daemon 
This is polinux/snmpd docker image with snmpd daemon running in foreground and based on offcial CentOS-7 and offers ability to provide any argument to snmpd process.

This container is built that any extra parameters provided to docker run will be passed directly to snmpd command. For example, if you run docker `run [run options] polinux/snmpd -c FILE` you pass `-c FILE` to snmpd daemon.

## Usage
### Basic

    docker run \
    -d \
    --name snmpd \
    -p 161:161/udp \
    polinux/snmpd

### Mount custom config , override some options
Using custom config file:  

    docker run \
    -d \
    --name snmpd \
    -p 161:161/udp \
    -v /my-snmpd.conf:/etc/snmpd/snmpd.conf \
    polinux/snmpd \
    -c /etc/snmpd/snmod.conf

### SNMPD CMD params
`snmpd` command can be used with some parameters to define monitoring server address and other parameters. Simple --help output below:

**`-f` (foregroud) used as default in this image**  

	Usage:  snmpd [OPTIONS] [LISTENING ADDRESSES]

	Version:  5.7.2
	Web:      http://www.net-snmp.org/
	Email:    net-snmp-coders@lists.sourceforge.net

	  -a			log addresses
	  -A			append to the logfile rather than truncating it
	  -c FILE[,...]		read FILE(s) as configuration file(s)
	  -C			do not read the default configuration files
			  (config search path: /etc/snmp:/usr/share/snmp:/usr/lib64/snmp:/root/.snmp)
	  -d			dump sent and received SNMP packets
	  -D[TOKEN[,...]]	turn on debugging output for the given TOKEN(s)
			  (try ALL for extremely verbose output)
			  Don't put space(s) between -D and TOKEN(s).
	  -f			do not fork from the shell
	  -g GID		change to this numeric gid after opening
			  transport endpoints
	  -h, --help		display this usage message
	  -H			display configuration file directives understood
	  -I [-]INITLIST	list of mib modules to initialize (or not)
			  (run snmpd with -Dmib_init for a list)
	  -L <LOGOPTS>		toggle options controlling where to log to
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
	  -m MIBLIST		use MIBLIST instead of the default MIB list
	  -M DIRLIST		use DIRLIST as the list of locations to look for MIBs
			  (default $HOME/.snmp/mibs:/usr/share/snmp/mibs)
	  -p FILE		store process id in FILE
	  -q			print information in a more parsable format
	  -r			do not exit if files only accessible to root
			  cannot be opened
	  -u UID		change to this uid (numeric or textual) after
			  opening transport endpoints
	  -v, --version		display version information
	  -V			verbose display
	  -x ADDRESS		use ADDRESS as AgentX address
	  -X			run as an AgentX subagent rather than as an
			  SNMP master agent

	Deprecated options:
	  -l FILE		use -Lf <FILE> instead
	  -P			use -p instead
	  -s			use -Lsd instead
	  -S d|i|0-7		use -Ls <facility> instead


