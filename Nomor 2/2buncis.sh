#!/bin/bash

# Configure zone for buncis.c05.com
echo 'zone "buncis.c05.com" {
    type master;
    file "/etc/bind/jarkom/buncis.c05.com";
    allow-transfer { 10.92.4.3; };  // IP Buncis
};' >> /etc/bind/named.conf.local

# Create zone file for buncis.c05.com
mkdir -p /etc/bind/jarkom
echo '$TTL    604800
@       IN      SOA     buncis.c05.com. root.buncis.c05.com. (
                            2023101001      ; Serial
                            604800          ; Refresh
                            86400           ; Retry
                            2419200         ; Expire
                            604800 )        ; Negative Cache TTL
;
@       IN      NS      buncis.c05.com.
@       IN      A       10.92.4.3          ; IP Buncis
' > /etc/bind/jarkom/buncis.c05.com

# Restart BIND9 service
service bind9 restart
