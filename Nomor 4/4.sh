#!/bin/bash

# Write zone configuration to named.conf.local
echo '
zone "4.92.10.in-addr.arpa" {
  type master;
  file "/etc/bind/jarkom/4.92.10.in-addr.arpa";
};
' > /etc/bind/named.conf.local

# Copy db.local template to jarkom directory for reverse DNS
cp /etc/bind/db.local /etc/bind/jarkom/4.92.10.in-addr.arpa

# Write reverse DNS configuration to 4.92.10.in-addr.arpa file
echo "
;
; BIND data file for local loopback interface
;
\$TTL    604800
@       IN      SOA     brokoli.c05.com. root.brokoli.c05.com. (
                        2024100601      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
4.92.10.in-addr.arpa. IN      NS      brokoli.c05.com.
2                       IN      PTR     brokoli.c05.com. 
4.92.10.in-addr.arpa. IN      NS      buncis.c05.com.
3                       IN      PTR     buncis.c05.com.;
" > /etc/bind/jarkom/4.92.10.in-addr.arpa

# Restart the BIND9 service
service bind9 restart

