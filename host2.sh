#!/bin/bash

ifconfig enp63s0:0 10.255.142.3/24
route add default gw 10.255.142.1
echo "nameserver 10.255.142.1" > /etc/resolv.conf