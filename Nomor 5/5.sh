#!/bin/bash

# Update zone file for bayam.c05.com with new TTL and other parameters
echo '$TTL    43200          ; 12 hours in seconds
@       IN      SOA     bayam.c05.com. root.bayam.c05.com. (
                            2023101005      ; Serial
                            7200            ; Refresh (2 hours in seconds)
                            1800            ; Retry (30 minutes in seconds)
                            1209600         ; Expire (2 weeks in seconds)
                            43200 )         ; Negative Cache TTL (12 hours in seconds)
;
@       IN      NS      bayam.c05.com.
@       IN      A       10.92.4.4          ; IP Bayam
www     IN      CNAME   bayam.c05.com.      ; Alias
' > /etc/bind/jarkom/bayam.c05.com

# Restart BIND9 service
service bind9 restart
