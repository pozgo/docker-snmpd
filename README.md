#SNMPD Daemon for use with Cacti 

Image build on <a href="https://registry.hub.docker.com/u/polinux/centos7/">Polinux Centos 7</a> docker image (polinux/centos7:latest). Port is set to deafault (161).


Implemented few environmental variables that might be used when starting container. 

> ENV SERVER_IP 127.0.0.1 (IP of the monitoring server)

> ENV LOCATION Office (ocation of the monitored node)

> ENV ADMIN_EMAIL sysadmin@email.com (System administrator email)

###How to run the container
`docker run -d --name snmpd -p 161:161 -e "SERVER_IP=127.0.0.1" -e "LOCATION=Office" -e "ADMIN_EMAIL=sysamin@email.com" polinux/snmod:latest` 