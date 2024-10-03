#!/bin/bash

# Update package list and install BIND9
apt-get update
apt-get install bind9 -y

# Configure named.conf.local with slave zones
echo 'zone "bayam.c05.com" {
    type slave;
    masters { 10.92.3.3; }; // IP Wortel
    file "/var/lib/bind/bayam.c05.com";
};

zone "brokoli.c05.com" {
    type slave;
    masters { 10.92.3.3; }; // IP Wortel
    file "/var/lib/bind/brokoli.c05.com";
};

zone "buncis.c05.com" {
    type slave;
    masters { 10.92.3.3; }; // IP Wortel
    file "/var/lib/bind/buncis.c05.com";
};' > /etc/bind/named.conf.local

# Restart BIND9 service
service bind9 restart
