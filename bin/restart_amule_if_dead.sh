#!/bin/bash

[ "$(sudo netstat -tlpn | grep ':4712'|wc -l )" -eq "0" ] &&  sudo systemctl restart amule-daemon.service && date >> /tmp/$0
