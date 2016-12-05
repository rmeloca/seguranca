#!/bin/bash

./firewall_stop.sh
ifconfig enp63s0:1 10.255.142.1/24
echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -t nat -A POSTROUTING -s 10.255.142.2 -j SNAT --to 172.16.1.142
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 3128 
iptables -P FORWARD DROP

iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to 10.255.142.2
iptables -A FORWARD -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -p tcp --sport 80 -j ACCEPT

iptables -A INPUT -s 10.255.142.0/24 -p tcp --dport 22 -j DROP

iptables -A INPUT ! -s 172.16.1.130 -p tcp --dport 22 -j DROP