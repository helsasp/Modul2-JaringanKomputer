#!/bin/bash

# Update zone file for bayam.c05.com
echo '$TTL    604800
@       IN      SOA     bayam.c05.com. root.bayam.c05.com. (
                            2023101001      ; Serial
                            604800          ; Refresh
                            86400           ; Retry
                            2419200         ; Expire
                            604800 )        ; Negative Cache TTL
;
@       IN      NS      bayam.c05.com.
@       IN      A       10.92.4.4          ; IP Bayam
www     IN      CNAME   bayam.c05.com.      ; Alias
' > /etc/bind/jarkom/bayam.c05.com

# Restart BIND9 service
service bind9 restart
