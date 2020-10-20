#!/bin/bash


sysctl -w net.ipv4.ip_forward=1                         #Enable packet forwarding
iptables -t nat -A POSTROUTING -o wlp2s0 -j MASQUERADE     #Enable masquerading
iptables -I FORWARD -o wlp2s0 -s 192.168.0.0/16 -j ACCEPT #Add iptable rules to FORWARD traffic from the subnet
iptables -I INPUT -s 192.168.0.0/16 -j ACCEPT           #Add iptable rules to ACCEPT traffic from the subnet
