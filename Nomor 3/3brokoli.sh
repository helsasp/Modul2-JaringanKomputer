#!/bin/bash

# Create or update zone file for brokoli.c05.com
echo '$TTL    604800
@       IN      SOA     brokoli.c05.com. root.brokoli.c05.com. (
                            2023101001      ; Serial
                            604800          ; Refresh
                            86400           ; Retry
                            2419200         ; Expire
                            604800 )        ; Negative Cache TTL
;
@       IN      NS      brokoli.c05.com.
@       IN      A       10.92.4.2          ; Ganti dengan IP node Brokoli
www     IN      CNAME   brokoli.c05.com.    ; Alias
' > /etc/bind/jarkom/brokoli.c05.com

# Restart BIND9 service
service bind9 restart
