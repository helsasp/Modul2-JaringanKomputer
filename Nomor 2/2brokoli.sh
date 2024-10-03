#!/bin/bash

# Configure zone for brokoli.c05.com
echo 'zone "brokoli.c05.com" {
    type master;
    file "/etc/bind/jarkom/brokoli.c05.com";
    allow-transfer { 10.92.4.2; };  // IP Brokoli
};' > /etc/bind/named.conf.local

# Create zone file for brokoli.c05.com
mkdir -p /etc/bind/jarkom
echo '$TTL    604800
@       IN      SOA     brokoli.c05.com. root.brokoli.c05.com. (
                            2023101001      ; Serial
                            604800          ; Refresh
                            86400           ; Retry
                            2419200         ; Expire
                            604800 )        ; Negative Cache TTL
;
@       IN      NS      bayam.c05.com.
@       IN      A       10.92.4.2          ; IP Brokoli
' > /etc/bind/jarkom/brokoli.c05.com

# Restart BIND9 service
service bind9 restart
