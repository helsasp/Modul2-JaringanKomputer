#!/bin/bash

# Update named.conf.local with zone configurations and notify settings
echo 'zone "bayam.c05.com" {
    type master;
    notify yes;
    also-notify { 10.92.3.2; };
    allow-transfer { 10.92.3.2; };  // Adding Pokcoy IP
    file "/etc/bind/jarkom/bayam.c05.com";
};

zone "brokoli.c05.com" {
    type master;
    notify yes;
    also-notify { 10.92.3.2; };
    allow-transfer { 10.92.3.2; };  // Adding Pokcoy IP
    file "/etc/bind/jarkom/brokoli.c05.com";
};

zone "buncis.c05.com" {
    type master;
    notify yes;
    also-notify { 10.92.3.2; };
    allow-transfer { 10.92.3.2; };  // Adding Pokcoy IP
    file "/etc/bind/jarkom/buncis.c05.com";
};' > /etc/bind/named.conf.local

# Restart BIND9 service
service bind9 restart
