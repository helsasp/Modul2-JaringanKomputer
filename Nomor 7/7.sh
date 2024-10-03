#!/bin/bash

# Update zone file for brokoli.c05.com with new A and CNAME records
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
www     IN      CNAME   brokoli.c05.com.    ; Alias untuk www
vitamin IN      A       10.92.3.2          ; IP untuk Pokcoy
www.vitamin IN  CNAME   vitamin.brokoli.c05.com. ; Alias untuk www.vitamin
' > /etc/bind/jarkom/brokoli.c05.com

# Restart BIND9 service
service bind9 restart
