[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/99wpTe72)
| Name           | NRP        | Kelas     |
| ---            | ---        | ----------|
| Helsa Sriprameswari Putri | 5025221154 | Jaringan Komputer (C) |
| Jamaluddin | 5025221157 | Jaringan Komputer (C) |

## Find your topology here!

- Link: https://drive.google.com/drive/folders/1ECQD6-cQkg0DzyflG-jSxJZaGaxg0KSU?usp=sharing

- Topology distribution for groups: https://docs.google.com/spreadsheets/d/1QKEZjixTStNbdXznOalJoJS0UQ6ed23o51pP8t8eAIM/edit?gid=1757558734#gid=1757558734

## Put your topology config image here!

![image](https://github.com/user-attachments/assets/bf886f2f-eee9-4b4b-887f-2a356f898cc4)


<br>

## Soal 1

> Topologi terdiri dari node Wortel yang berupa DNS Master*. Selain itu, terdapat pula node Pokcoy sebagai DNS Slave*, yang bertugas sebagai cadangan dari node Wortel.
> <br> </br>
> Selanjutnya terdapat node Tomat dan Taoge yang bekerja sebagai Client*, tiga buah Web Server* yaitu Bayam, Buncis, dan Brokoli, serta Mayur sebagai Router*. Buatlah topologi sesuai dengan pembagian topologi [di sini](https://docs.google.com/spreadsheets/d/1QKEZjixTStNbdXznOalJoJS0UQ6ed23o51pP8t8eAIM/edit?usp=sharing) dan konfigurasi topologi [di sini](https://drive.google.com/drive/folders/1ECQD6-cQkg0DzyflG-jSxJZaGaxg0KSU?usp=sharing). Pastikan bahwa setiap node dapat terhubung ke Internet.

> _The topology consists of a Wortel node which is a DNS Master*. In addition, there is also a Pokcoy node as a DNS Slave*, which serves as a backup for the Wortel node._
> <br> </br>
> _Furthermore, there are Tomat and Taoge nodes that work as Client*, three Web Servers*, namely Bayam, Buncis, and Brokoli, then finally Mayur as Router*. Make a topology according to the topology division [here](https://docs.google.com/spreadsheets/d/1QKEZjixTStNbdXznOalJoJS0UQ6ed23o51pP8t8eAIM/edit?usp=sharing) and the topology configuration [here](https://drive.google.com/drive/folders/1ECQD6-cQkg0DzyflG-jSxJZaGaxg0KSU?usp=sharing). Make sure that each node can connect to the Internet._

**Answer:**

- Screenshot

![image](https://github.com/user-attachments/assets/97db444d-c8fe-4aee-b0fa-c1a3ec9a94e1)

- Explanation

Client sudah bisa ping ke google.com yang artinya sudah terconnect server internet. <br>
  Config : 
```
Mayur

auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
	address 10.92.1.1
	netmask 255.255.255.0

auto eth2
iface eth2 inet static
	address 10.92.2.1
	netmask 255.255.255.0

auto eth3
iface eth3 inet static
	address 10.92.3.1
	netmask 255.255.255.0

auto eth4
iface eth4 inet static
	address 10.92.4.1
	netmask 255.255.255.0

up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.92.0.0/16

TomatClient

auto eth0
iface eth0 inet static
	address 10.92.1.2
	netmask 255.255.255.0
	gateway 10.92.1.1

TaugeClient

auto eth0
iface eth0 inet static
	address 10.92.2.2
	netmask 255.255.255.0
	gateway 10.92.2.1



PokCoyDNSSlave


auto eth0
iface eth0 inet static
	address 10.92.3.2
	netmask 255.255.255.0
	gateway 10.92.3.1

WortelDNSMaster

auto eth0
iface eth0 inet static
	address 10.92.3.3
	netmask 255.255.255.0
	gateway 10.92.3.1

BrokoliWebServer

auto eth0
iface eth0 inet static
	address 10.92.4.2
	netmask 255.255.255.0
	gateway 10.92.4.1

BuncisWebServer

auto eth0
iface eth0 inet static
	address 10.92.4.3
	netmask 255.255.255.0
	gateway 10.92.4.1

BayamWebServer

auto eth0
iface eth0 inet static
	address 10.92.4.4
	netmask 255.255.255.0
	gateway 10.92.4.1
```
Lalu lakukan `echo "nameserver 10.92.3.3" > /etc/resolv.conf` ke semua node
<br>

## Soal 2

> Tambahkan konfigurasi untuk domain bayam.yyy.com yang mengarah ke IP node Bayam di DNS Master. Dengan cara yang sama, buat konfigurasi domain brokoli.yyy.com yang mengarah ke IP node Brokoli dan domain buncis.yyy.com yang mengarah ke IP node Buncis. Simpan semua konfigurasi dalam folder Jarkom. Selama pengerjaan soal, ubah yyy menjadi kode kelompok masing-masing (contoh: A02).
> <br> </br>
> Jangan lupa update konfigurasi kedua client agar dapat berkomunikasi dengan semua domain tersebut.


> _Add a configuration for bayam.yyy.com domain that points to the Bayam node IP in the DNS Master. In the same way, create a brokoli.yyy.com domain configuration that points to the Brokoli node IP and a buncis.yyy.com domain that points to the Buncis node IP. Save all configurations in a folder called Jarkom. For this practicum, substitute yyy with the code of each group (ex: A02).
> <br> </br> 
> Don't forget to update the configuration of both clients so that they can communicate with the domains._

**Answer:**

- Screenshot
![image](https://github.com/user-attachments/assets/a6f9b880-4e52-4162-a417-5bd24f312c9f)
![image](https://github.com/user-attachments/assets/778d1da9-f7cd-4c10-8164-d389965ef61f)
![image](https://github.com/user-attachments/assets/33f93eff-4e05-4704-a263-ba316201c4f0)



- Explanation

  Webserver buncis,borkoli,dan bayam sudah bisa ping brokoli.c05.com, buncis.c05.com, dan bayam.c05.com <br>

Untuk bayam.c05.com : <br>

Wortel
```
apt-get update
apt-get install bind9 -y

nano /etc/bind/named.conf.local

zone "bayam.c05.com" {
	type master;
	file "/etc/bind/jarkom/bayam.c05.com";
	allow-transfer { 10.92.4.4; };  // IP Bayam
};


nano /etc/bind/jarkom/bayam.c05.com

$TTL	604800
@   	IN  	SOA	bayam.c05.com. root.bayam.c05.com. (
                    	2023101001  	; Serial
                     	604800     	; Refresh
                      	86400     	; Retry
                    	2419200     	; Expire
                     	604800 )   	; Negative Cache TTL
;
@   	IN  	NS  	bayam.c05.com.
@   	IN  	A   	10.92.4.4   	; IP Bayam

service bind9 restart
```
Bayam
```
echo "nameserver 10.92.3.3" > /etc/resolv.conf

ping bayam.c05.com -c 5
```

Untuk brokoli.c05.com :<br>

Wortel
```
nano /etc/bind/named.conf.local

zone "brokoli.c05.com" {
	type master;
	file "/etc/bind/jarkom/brokoli.c05.com";
	allow-transfer { 10.92.4.2; };  // IP Brokoli
};


nano /etc/bind/jarkom/brokoli.c05.com

$TTL	604800
@   	IN  	SOA	brokoli.c05.com. root.brokoli.c05.com. (
                    	2023101001  	; Serial
                     	604800     	; Refresh
                      	86400     	; Retry
                    	2419200     	; Expire
                     	604800 )   	; Negative Cache TTL
;
@   	IN  	NS  	bayam.c05.com.
@   	IN  	A   	10.92.4.2   	; IP Brokoli

service bind9 restart
```
Brokoli
```
echo "nameserver 10.92.3.3" > /etc/resolv.conf

ping brokoli.c05.com -c 5
```

Untuk buncis.c05.com

Wortel
```
nano /etc/bind/named.conf.local

zone "buncis.c05.com" {
	type master;
	file "/etc/bind/jarkom/brokoli.c05.com";
	allow-transfer { 10.92.4.3; };  // IP Buncis
};


nano /etc/bind/jarkom/buncis.c05.com

$TTL	604800
@   	IN  	SOA	buncis.c05.com. root.buncis.c05.com. (
                    	2023101001  	; Serial
                     	604800     	; Refresh
                      	86400     	; Retry
                    	2419200     	; Expire
                     	604800 )   	; Negative Cache TTL
;
@   	IN  	NS  	buncis.c05.com.
@   	IN  	A   	10.92.4.3   	; IP Buncis

service bind9 restart
```
Buncis
```
echo "nameserver 10.92.3.3" > /etc/resolv.conf

ping buncis.c05.com -c 5
```

<br>

## Soal 3

> Tambahkan domain alias berupa www.bayam.yyy.com pada alamat bayam.yyy.com dan www.brokoli.yyy.com pada alamat brokoli.yyy.com.

> _Add a domain alias in the form of www.bayam.yyy.com to the bayam.yyy.com address and www.brokoli.yyy.com to the brokoli.yyy.com address._

**Answer:**

- Screenshot

![image](https://github.com/user-attachments/assets/87394a3b-4e3d-4443-9daa-684e5401f034)
![image](https://github.com/user-attachments/assets/f5f1165b-5f55-4de6-b13b-cdb65bb331fe)
![image](https://github.com/user-attachments/assets/dce0cefc-4844-4c37-9479-20fc7cbf095c)


- Explanation

  Webserver buncis,borkoli,dan bayam sudah bisa ping brokoli.c05.com, buncis.c05.com, dan bayam.c05.com dengan alias www.brokoli.c05.com, www.buncis.c05.com, dan www.bayam.c05.com

Untuk www.bayam.c05.com : <br>

Wortel
```
nano /etc/bind/jarkom/bayam.c05.com

$TTL	604800
@   	IN  	SOA	bayam.c05.com. root.bayam.c05.com. (
                    	2023101001  	; Serial
                     	604800     	; Refresh
                      	86400     	; Retry
                    	2419200     	; Expire
                     	604800 )   	; Negative Cache TTL
;
@   	IN  	NS  	bayam.c05.com.
@   	IN  	A   	10.92.4.4   	; IP Bayam
www 	IN  	CNAME   bayam.c05.com.  ; Alias

service bind9 restart
```


Bayam
```
ping www.bayam.c05.com -c 5
```

Untuk www.brokoli.c05.com <br>

Wortel
```
nano /etc/bind/jarkom/brokoli.c05.com

$TTL	604800
@   	IN  	SOA	brokoli.c05.com. root.brokoli.c05.com. (
                    	2023101001  	; Serial
                     	604800     	; Refresh
                      	86400     	; Retry
                    	2419200     	; Expire
                     	604800 )   	; Negative Cache TTL
;
@   	IN  	NS  	brokoli.c05.com.
@   	IN  	A   	10.92.4.2   	; Ganti dengan IP node Brokoli 
www 	IN  	CNAME   brokoli.c05.com. ; Alias 

service bind9 restart
```
Brokoli
```
ping www.brokoli.c05.com -c 5
```
Untuk www.buncis.c05.com <br>
Wortel
```
nano /etc/bind/jarkom/buncis.c05.com

$TTL	604800
@   	IN  	SOA	buncis.c05.com. root.buncis.c05.com. (
                    	2023101001  	; Serial
                     	604800     	; Refresh
                      	86400     	; Retry
                    	2419200     	; Expire
                     	604800 )   	; Negative Cache TTL
;
@   	IN  	NS  	buncis.c05.com.
@   	IN  	A   	10.92.4.3   	; Ganti dengan IP node Buncis
www 	IN  	CNAME   buncis.c05.com. ; Alias 

service bind9 restart
```
Buncis
```
ping www.buncis.c05.com -c 5

```


<br>

## Soal 4

> Tambahkan record reverse domain untuk domain brokoli.yyy.com dan buncis.yyy.com.

> _Add a reverse domain record for brokoli.yyy.com and buncis.yyy.com domains._

**Answer:**

- Screenshot

  ![image](https://github.com/user-attachments/assets/6ec4dc7e-484f-4778-9531-b1b7fcf16b5c)


- Explanation

  Client sudah bisa melakukan reverse ping dimana host -t PTR 10.92.4.2 mengarah ke brokoli.c05.com dan host -t PTR 10.92.4.3 mengarah ke buncis.c05.com

Wortel :
```
nano /etc/bind/named.conf.local

  zone "4.92.10.in-addr.arpa" {
  type master;
  file "/etc/bind/jarkom/4.92.10.in-addr.arpa";
  };

cp /etc/bind/db.local /etc/bind/jarkom/4.92.10.in-addr.arpa

  nano /etc/bind/jarkom/4.92.10.in-addr.arpa

;
; BIND data file for local loopback interface
;
$TTL    604800
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


  service bind9 restart
 
``` 
Di client (Tomat Client)
```
apt-get update
apt-get install dnsutils

nano /etc/resolv.conf
echo nameserver 10.92.3.3 > /etc/resolv.conf

  host -t PTR 10.92.4.2

```


<br>

## Soal 5

> Ubah record SOA dari domain bayam.yyy.com sesuai dengan ketentuan berikut:
> - Lama waktu server slave menunggu untuk mengecek salinan baru server master adalah sebesar 2 jam.
> - Field yang mengatur revisi file zona ini diubah menjadi tanggal awal praktikum (format YYYYMMDD) kemudian diikuti dengan nomor kelompok (contoh untuk kelompok A02 maka nomornya 02).
> - Lamanya waktu server harus menunggu untuk meminta pembaruan lagi dari nameserver master yang tidak responsif sebesar 30 menit.
> - Lama waktu nama domain di-cache secara lokal sebelum kadaluarsa dan kembali ke nameserver otoritatif untuk informasi terbaru sebesar 12 jam.
> - Jika server slave tidak mendapatkan respons dari server master dalam waktu 2 minggu, server tersebut harus berhenti merespons kueri untuk zona tersebut.

> _Change the SOA record of the bayam.yyy.com domain according to the following conditions:_
> - The length of time the slave server waits to check for a new revision of the master server is 2 hours.
> - The field that regulates the revision of this zone file is changed to the start date of the practicum (YYYYMMDD format) then followed by the group number (ex: for A02 the group number would be 02).
> - The length of time the server has to wait to request another update from an unresponsive master nameserver is 30 minutes.
> - The length of time a domain name is cached locally before it expires and returns to an authoritative nameserver for up-to-date information is 12 hours.
> - If the slave server does not get a response from the master server within 2 weeks, it must stop responding to queries for that zone.

**Answer:**

- Screenshot

  ![image](https://github.com/user-attachments/assets/7a61242d-8d65-4b42-83dd-d1583fdaa065)


- Explanation

  `Webserver bayam berhasil melakukan ping ke ping bayam.c05.com -c 5 dan ping www.bayam.c05.com -c 5 yang artinya setup sudah sesuai dan tidak ada masalah.`

<br>

![image](https://github.com/user-attachments/assets/47ff6efe-9879-49db-b37a-96945096bacf)

<br>





## Soal 6

> Untuk menangani request yang berlebih dari client ke ketiga alamat yang tadi dibuat, konfigurasikan node Pokcoy sebagai DNS Slave yang bekerja untuk DNS Master Wortel.

> _To handle excess requests from the client to the three addresses created, configure the Pokcoy node as the DNS Slave that works for Wortel DNS Master._

**Answer:**

- Screenshot

  ![image](https://github.com/user-attachments/assets/c7575ed8-9135-46d7-ac30-da71efa78b64)


- Explanation

  `Ketika WortelDNSMaster di stop, PokcoyDNSlave berperan menjadi dnsslave yang tetap menjalankan server ketika dn master unaivalable. Client bisa tetap melakukan ping server walaupun DNS master dimatikan dengan bantuan DNS slave.`

<br>

Konfigurasi dari shell script yang berada di dns master
<br>


<img width="562" alt="image" src="https://github.com/user-attachments/assets/7c014be1-77e0-49b6-bcb8-e24d4fc33a4c">

<br>

Konfigurasi shell script yang berada di dns slave

![image](https://github.com/user-attachments/assets/d46f0c50-6c2f-4a91-8b3f-49362184347c)


## Soal 7

> Karena membutuhkan tempat untuk menyimpan resep brokoli, buatlah subdomain berupa vitamin.brokoli.yyy.com dengan alias www.vitamin.brokoli.yyy.com dengan mendelegasikannya dari Wortel ke Pokcoy dengan alamat IP menuju Brokoli yang diatur di folder Vitamin.

> _Since we need a place to store Brokoli recipes, create a subdomain in the form of vitamin.brokoli.yyy.com with an alias of www.vitamin.brokoli.yyy.com by delegating it from Wortel to Pokcoy with an ip to the Brokoli node in a folder called Vitamin._

**Answer:**

- Screenshot

  ![image](https://github.com/user-attachments/assets/52dd0472-3d48-4ea9-88fe-8416d4e6252a)


- Explanation

  `Client sudah bisa ping ke subdomain vitamin.brokoli.c05.com dengan alias www.vitamin.brokoli.c05.com`

  Pada DNS Master

  ```
  nano /etc/bind/named.conf.options
  comment dnssc
  allow-query{any;};
  ```

  Pada DNS Slave
  ```
  nano /etc/bind/named.conf.options
  ```
  ```
  comment dnssc
  allow-query{any;};
  ```
  
  ```
  nano /etc/bind/named.conf.local
  ```
  ```
  zone "vitamin.brokoli.c05.com" {
	type master;
	file "/etc/bind/vitamini/vitamin.brokoli.c05.com";
  };
  ```

  ```
  mkdir /etc/bind/vitamin
  cp /etc/bind/db.local /etc/bind/vitamin/vitamin.brokoli.c05.com
  nano /etc/bind/vitamin/vitamin.brokoli.c05.com
  ;
  ; BIND data file for local loopback interface
  ;
  $TTL	604800
  @   	IN  	SOA 	vitamin.brokoli.c05.com. root.vitamin.brokoli.c05.com. (
                     	2024100601 	; Serial
                     	604800     	; Refresh
                      	86400     	; Retry
                    	2419200     	; Expire
                     	604800 )   	; Negative Cache TTL
  ;
  @   	IN  	NS  	vitamin.brokoli.c05.com.
  @   	IN  	A   	10.92.3.2	; IP Pokcoy
  www 	IN  	CNAME   vitamin.brokoli.c05.com.  ; Alias www.vitamin.brokoli.c05.com
  ```
  ```
  service bind9 restart

  ```
<br>

## Soal 8

> Buatlah subdomain khusus untuk kandungan brokoli dengan akses k1.vitamin.brokoli.yyy.com dengan alias www.k1.vitamin.brokoli.yyy.com yang mengarah ke IP brokoli dan diatur di folder k1.  

> _Create a special subdomain for Brokoli content called k1.vitamin.brokoli.yyy.com with an alias called www.k1.vitamin.brokoli.yyy.com that point to Brokoli node and are organized in a folder called k1._

**Answer:**

- Screenshot

  ![image](https://github.com/user-attachments/assets/a0c39509-8727-4e02-a0f8-25da465d861c)
   ![image](https://github.com/user-attachments/assets/d2ac9235-7c1c-41f6-9287-d6d1d0fa3d2d)


- Explanation

  `web server bayam berhasil ping ke sub domain vitamin yaitu k1.vitamin.brokoli.c05.com` <br>
Di Pokcoy (Slave):

 ```
nano /etc/bind/named.conf.local

zone "k1.vitamin.brokoli.c05.com" {
	type master;
	file "/etc/bind/k1/k1.vitamin.brokoli.c05.com"; // Lokasi file cache zon
};


mkdir -p /etc/bind/k1

cp /etc/bind/db.local /etc/bind/k1/k1.vitamin.brokoli.c05.com

nano /etc/bind/k1/k1.vitamin.brokoli.c05.com

;
; BIND data file for local loopback interface
;
$TTL	604800
@   	IN  	SOA 	k1.vitamin.brokoli.c05.com. root.k1.vitamin.brokoli.c05.com. (
                        2024100601    ; Serial
                     	604800     	; Refresh
                      	86400     	; Retry
                    	2419200     	; Expire
                     	604800 )   	; Negative Cache TTL
;
@   	IN  	NS  	k1.vitamin.brokoli.c05.com.
@   	IN  	A   	10.92.4.2
www 	IN  	CNAME   k1.vitamin.brokoli.c05.com.
k1  	IN  	A   	10.92.3.2
@   	IN 	 AAAA    ::1

service bind9 restart

 ```

Di brokoli (web server) :

 ```

nano /etc/resolv.conf 

nameserver 10.92.3.2
nameserver 10.92.3.3

ping k1.vitamin.brokoli.c05.com.
ping www.k1.vitamin.brokoli.c05.com.
 ```



<br>

## Soal 9 (REVISI)

> Bayam, Brokoli, dan Buncis masing-masing berfungsi sebagai web server nginx yang menyajikan resep khusus untuk jenis sayuran yang mereka tangani. Untuk mengaktifkan web server pada masing-masing worker, lakukan deployment website menggunakan sumber yang tersedia di sayur_webserver_nginx. Tambahkan konfigurasi untuk log error ke file /var/log/nginx/error.log dan log access ke file /var/log/nginx/access.log.

> _Bayam, Brokoli, and Buncis each function as nginx web servers that serve special recipes for the type of vegetables they handle. To activate the web server on each worker, do the deployment using the resources available in sayur_webserver_nginx. Add configuration for error log to the file /var/log/nginx/error.log and access log to the file /var/log/nginx/access.log._

**Answer:**

- Screenshot

  ![image](https://github.com/user-attachments/assets/67256973-ec4c-49e3-9810-aedff900d0a9)
![image](https://github.com/user-attachments/assets/1a46c32d-5447-4437-bbd0-f7f6a940e86e)


- Explanation

  `Client sudah bisa melakukan deploy dengan menggunakan lynx ip masing-masing webserver. Agar bisa dideploy, webserver mengofigurasi nginx seperti implementasi berikut.`

  Di bayam (web server) :
 ```
apt-get update
apt-get install -y nginx php php-fpm wget unzip
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1tFDk7pKRQLd3BMUcyvfAfEL-drvIxdSl' -O sayur_webserver_nginx.zip
unzip -o sayur_webserver_nginx.zip -d sayur_webserver_nginx

mkdir -p /var/www/bayam

cp -r sayur_webserver_nginx/* /var/www/bayam/

nano /etc/nginx/sites-available/bayam

 server {
    listen 8001;

    root /var/www/bayam;

    index index.php index.html index.htm;
    server_name BayamWebServer;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    # pass PHP scripts to FastCGI server
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }

    error_log /var/log/nginx/error.log;
    access_log /var/log/nginx/access.log;
}


ln -s /etc/nginx/sites-available/bayam /etc/nginx/sites-enabled/
cp -r /var/www/bayam/sayur_webserver_nginx/* /var/www/bayam/
service php7.2-fpm start
service nginx restart
nginx -t
 ```
  Di buncis (web server) : <br>

```
apt-get update
apt-get install -y nginx php php-fpm wget unzip

wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1tFDk7pKRQLd3BMUcyvfAfEL-drvIxdSl' -O sayur_webserver_nginx.zip

unzip -o sayur_webserver_nginx.zip -d sayur_webserver_nginx

mkdir -p /var/www/buncis

cp -r sayur_webserver_nginx/* /var/www/buncis/

nano /etc/nginx/sites-available/buncis

server {
    listen 8002;

    root /var/www/buncis;

    index index.php index.html index.htm;
    server_name BuncisWebServer;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    # pass PHP scripts to FastCGI server
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }

    error_log /var/log/nginx/error.log;
    access_log /var/log/nginx/access.log;
}


ln -s /etc/nginx/sites-available/buncis /etc/nginx/sites-enabled/

cp -r /var/www/buncis/sayur_webserver_nginx/* /var/www/buncis/

service php7.2-fpm start

service nginx restart

nginx -t

 ```

 Di brokoli (web server) :
 ```
apt-get update

apt-get install -y nginx php php-fpm wget unzip

wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1tFDk7pKRQLd3BMUcyvfAfEL-drvIxdSl' -O sayur_webserver_nginx.zip


unzip -o sayur_webserver_nginx.zip -d sayur_webserver_nginx

mkdir -p /var/www/brokoli

cp -r sayur_webserver_nginx/* /var/www/brokoli/

nano  /etc/nginx/sites-available/brokoli

 server {
    listen 8003;

    root /var/www/brokoli;

    index index.php index.html index.htm;
    server_name BrokoliWebServer;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    # pass PHP scripts to FastCGI server
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }

    error_log /var/log/nginx/error.log;
    access_log /var/log/nginx/access.log;
}


ln -s /etc/nginx/sites-available/brokoli /etc/nginx/sites-enabled/

cp -r /var/www/brokoli/sayur_webserver_nginx/* /var/www/brokoli/

service php7.2-fpm start

service nginx restart

nginx  -t
 ```

Testing di tomat client :
 ```
lynx 10.92.4.2
lynx 10.92.4.3
lynx 10.92.4.4 
 ```

<br>

## Soal 10 (REVISI)

> Pada masing masing worker nginx, akan terdapat beberapa hal yang perlu diperbaiki pada resource yang diberikan untuk bisa menampilkan resep saat halaman dimuat. Analisis kesalahan yang ada di resource melalui file /var/log/nginx/error.log dan perbaiki hingga halaman bisa menampilkan resep sesuai dengan worker nya.

> _On each nginx worker, there will be several things that need to be fixed in the resources provided to be able to display recipes when the page is loaded. Analyze the errors in the resource through the /var/log/nginx/error.log file and fix it until the page can display recipes according to its worker._

**Answer:**

- Screenshot


![image](https://github.com/user-attachments/assets/3aaba300-0f8b-4e57-90b4-b07bac5323d3)
![image](https://github.com/user-attachments/assets/f4cb7d51-92b9-46af-a92f-fb99535e6f31)
![image](https://github.com/user-attachments/assets/94722a74-71a4-4c83-afce-90e535d5a374)


- Explanation

  `Kini client sudah bisa menampilkan resep dengan menambahkan hostname dan mengecek di error log sebagai berikut : `


CARA TESTING BAYAM
 ```
curl http://BayamWebServer:8001

tail -f /var/log/nginx/error.log

hostname Bayam

curl http://BayamWebServer:8001

mv /var/www/bayam/resep1.php /var/www/bayam/resep_1.php

curl http://BayamWebServer:8001
 ```
CARA TESTING BUNCIS
 ```
curl http://BuncisWebServer:8002

hostname Buncis

mv /var/www/buncis/resep2.php /var/www/buncis/resep_2.php

curl http://BuncisWebServer:8002
 ```
CARA TESTING BROKOLI
 ```
curl http://BrokoliWebServer:8003

hostname Brokoli

mv /var/www/brokoli/resep3.php /var/www/brokoli/resep_3.php

curl http://BrokoliWebServer:8003
 ```

<br>

## Soal 11 (REVISI)

> Setelah website berhasil dideploy pada masing-masing worker (Bayam, Brokoli, dan Buncis) dan halaman dapat menampilkan resep sayuran yang sesuai,  buatlah custom access log ke file /var/log/nginx/access.log di masing-masing web server worker menggunakan format log tertentu seperti di bawah:
> - Tanggal dan waktu akses dalam format standar log.
Nama worker yang sedang dilayani (misalnya: Bayam, Brokoli, atau Buncis).
> - Alamat IP klien yang mengakses website.
> - Metode HTTP dan URI yang diakses oleh klien.
> - Status respons HTTP yang diberikan oleh server.
> - Jumlah byte yang dikirimkan dalam respons.
> - Waktu yang dihabiskan oleh server untuk menangani permintaan.
> <br> </br>
> Contoh format log yang sesuai: 
[01/Oct/2024:11:30:45 +0000] Jarkom Node Bayam Access from 192.168.1.15 using method "GET /resep/bayam HTTP/1.1" returned stat


> _After successfully deploying the website on each worker (Bayam, Brokoli, and Buncis) and ensuring the pages display the appropriate vegetable recipes, create a custom access log file at /var/log/nginx/access.log on each web server worker using a specific log format as described below:_
> - _Access date and time in standard log format._
> - _Name of the worker serving the request (e.g., Bayam, Brokoli, or Buncis)._
> - _Client IP address accessing the website._
> - _HTTP method and URI accessed by the client._
> - _HTTP response status provided by the server.__
> - _Number of bytes sent in the response.
> - _Time taken by the server to handle the request._
> <br> </br>
> _Example of the appropriate log format:
[01/Oct/2024:11:30:45 +0000] Jarkom Node Bayam Access from 192.168.1.15 using method "GET /resep/bayam HTTP/1.1" returned status 200 with 2567 bytes sent in 0.038 seconds_


**Answer:**

- Screenshot

![image](https://github.com/user-attachments/assets/0f54e4e2-5eea-4241-a560-000df61ce976)
![image](https://github.com/user-attachments/assets/e9aee5d7-bdcc-4fb1-a07e-66328379e2e4)
![image](https://github.com/user-attachments/assets/9a7d5a8c-4cbd-44bd-b614-4ab9487d5ac2)


- Explanation

  `Hasil catatan log sudah sesuai format dengan cara menambahkan custom log format di access log yang sudah dibuat sebelumnya.`

Bayam
 ```
nano /etc/nginx/nginx.conf

tambahkan format custom log di bawah http :
 
log_format custom_log_format '[$time_local] Jarkom Node $server_name Access from $remote_addr using method "$request" returned status $status with $body_bytes_sent bytes sent in $request_time seconds';
 
nano /etc/nginx/sites-available/bayam
tambahkan di sebelah access_log
custom_log_format;
 ```
TESTING
 ```
nginx -t
service nginx restart
Client :
curl http://BayamWebServer:8001
tail -f /var/log/nginx/access.log
 ```

Buncis
 ```
nano /etc/nginx/nginx.conf

log_format custom_log_format '[$time_local] Jarkom Node $server_name Access from $remote_addr using method "$request" returned status $status with $body_bytes_sent bytes sent in $request_time seconds';

nano /etc/nginx/sites-available/buncis
custom_log_format;
 ```

TESTING
 ```
nginx -t
service nginx restart
curl http://BuncisWebServer:8002
tail -f /var/log/nginx/access.log
 ```

Brokoli
 ```
nano /etc/nginx/nginx.conf
log_format custom_log_format '[$time_local] Jarkom Node $server_name Access from $remote_addr using method "$request" returned status $status with $body_bytes_sent bytes sent in $request_time seconds';
 
nano /etc/nginx/sites-available/brokoli


custom_log_format;
 ```

TESTING
 ```
nginx -t
service nginx restart
curl http://BrokoliWebServer:8003
tail -f /var/log/nginx/access.log
 ```

<br>

## Soal 12 (REVISI)

> Informasi vitamin pada sayur brokoli akan ditampilkan pada subdomain vitamin.brokoli.yyy.com di node brokoli, buatlah DocumentRoot yang disimpan pada /var/www/vitamin.brokoli.yyy. Konfigurasikan webserver dengan nama server vitamin.brokoli.yyy.com dan server alias www.vitamin.brokoli.yyy.com. Lakukan konfigurasi Apache Web Server pada Brokoli dengan menggunakan sumber yang tersedia di [sini](https://docs.google.com/uc?export=download&id=1QbGkKXo3jt4c68AdVAkl1hD4LolTUPg2).

> _For information on vitamins in brokoli will be displayed on the vitamin.brokoli.yyy.com subdomain on the brokoli node, create a DocumentRoot stored in /var/www/vitamin.brokoli.yyy. Configure the web server with the server name vitamin.brokoli.yyy.com and server alias www.vitamin.brokoli.yyy.com. Configure the Apache Web Server on Brokoli using [this resource](https://docs.google.com/uc?export=download&id=1QbGkKXo3jt4c68AdVAkl1hD4LolTUPg2)._

**Answer:**

- Screenshot

![image](https://github.com/user-attachments/assets/bc7833fb-b2ef-4cb7-b21d-93292242288a)
![image](https://github.com/user-attachments/assets/4a27e0f9-c123-427a-9013-49ad9ba873ff)


- Explanation

  `Agar webserver bisa dibuka dengan nama dan alias tsb, maka harus dilakukan virtual host dan site configuration. Jika sudah dapat dilakukan testing di lynx`

Brokoli :
 ```
apt-get update
apt-get install lynx

#Download & Unzip
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1NhsaTLD4Zk06BZJCqdN_oqoxB3uIg2C7' -O vitamin_brokoli.zip

unzip vitamin_brokoli.zip -d /var/www/

mv /var/www/vitamin.brokoli.yyy.com /var/www/vitamin.brokoli.c05

#Set permission
chown -R www-data:www-data /var/www/vitamin.brokoli.c05
chmod -R 755 /var/www/vitamin.brokoli.c05

#Virtual Host Configuration
nano  /etc/apache2/sites-available/vitamin.brokoli.c05.com.conf

<VirtualHost *:80>
    ServerAdmin admin@vitamin.brokoli.c05.com
    ServerName vitamin.brokoli.c05.com
    ServerAlias www.vitamin.brokoli.c05.com

    DocumentRoot /var/www/vitamin.brokoli.c05

    ErrorLog ${APACHE_LOG_DIR}/vitamin.brokoli.c05.error.log
    CustomLog ${APACHE_LOG_DIR}/vitamin.brokoli.c05.access.log combined

    <Directory /var/www/vitamin.brokoli.c05>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>


#Enable Site
a2ensite vitamin.brokoli.c05.com.conf

#Restart apache
service apache2 restart
 ```

TESTING

 ```
client

nano /etc/hosts

10.92.4.2 vitamin.brokoli.c05.com www.vitamin.brokoli.c05.com

lynx http://vitamin.brokoli.c05.com

 ```



<br>

## Soal 13 (REVISI)

> Pada subdomain vitamin.brokoli.yyy.com, terdapat subfolder /nutrisi yang menyediakan informasi tentang berbagai vitamin dalam brokoli, seperti Vitamin A, C, dan K. Aktifkan directory listing untuk folder /nutrisi, dan buatlah rewrite rule di Apache untuk memperbaiki URL agar halaman seperti www.vitamin.brokoli.yyy.com/nutrisi/vitamin_a.php dapat diakses hanya dengan www.vitamin.brokoli.yyy.com/nutrisi/vitamin_a. Pastikan setiap halaman vitamin dapat diakses langsung melalui url yang telah disederhanakan.

> _On the vitamin.brokoli.yyy.com subdomain, there is a /nutrisi subfolder that provides information about various vitamins in brokoli, such as Vitamin A, C, and K. Activate directory listing for the /nutrisi folder, and create a rewrite rule in Apache to fix the URL so that pages like www.vitamin.brokoli.yyy.com/nutrisi/vitamin_a.php can be accessed only with www.vitamin.brokoli.yyy.com/nutrisi/vitamin_a. Make sure each vitamin page can be accessed directly through the simplified url._

**Answer:**

- Screenshot

![image](https://github.com/user-attachments/assets/44fdbc35-3b5c-44e0-bf2e-5fd6ce319e86)
![image](https://github.com/user-attachments/assets/630cbec2-2cc6-4847-a4e0-e4783dcb18ea)
![image](https://github.com/user-attachments/assets/d5afe850-48f0-4e4f-90b7-88e9603bbb05)
![image](https://github.com/user-attachments/assets/0f8d280b-21e5-4f1f-9ddf-1a339f346bda)

- Explanation

  `Kini client sudah bisa akses subfolder vitamin a,c,k yang ada dalam nutri dengan mengonfigurasikan apache yang terdiri dari beberapa konfigurasi, seperti konfigurasi direktori, rewrite, dan autoindex`


Di brokoli :
 ```
nano /etc/apache2/sites-available/vitamin.brokoli.c05.com.conf

#Tambahkan
<Directory /var/www/vitamin.brokoli.c05/nutrisi>
    Options +Indexes
    AllowOverride All
</Directory>

Selanjutnya
nano /var/www/vitamin.brokoli.c05/nutrisi/.htaccess


RewriteEngine On
RewriteBase /nutrisi/

# Rewrite rule to remove .php extension
RewriteCond %{REQUEST_FILENAME} !-d
RewriteCond %{REQUEST_FILENAME}.php -f
RewriteRule ^(.*)$ $1.php [L]

# Enable mod_rewrite:
a2enmod rewrite

# Enable mod_autoindex:
a2enmod autoindex

# Restart Apache to apply the changes:
service apache2 restart
 ```
TESTING
 ```
lynx http://www.vitamin.brokoli.c05.com/nutrisi/vitamin_a
 ```
<br>

## Soal 14 (REVISI)

> Tambahkan alias untuk folder /public/images/ pada subdomain www.vitamin.brokoli.yyy.com agar folder tersebut dapat diakses langsung melalui url www.vitamin.brokoli.yyy.com/img.

> _Add an alias for the /public/images/ folder on the www.vitamin.brokoli.yyy.com subdomain so that the folder can be accessed directly through the url www.vitamin.brokoli.yyy.com/img._

**Answer:**

- Screenshot

![image](https://github.com/user-attachments/assets/ec672ad3-1022-4968-9777-ede99c9840cc)
![image](https://github.com/user-attachments/assets/996311eb-a931-4ee6-b5a9-ea62aaff3d65)


- Explanation

  `Sekarang client bisa mengakses folder /public/images pada subdomain tsb dengan url www.vitamin.brokoli.yyy.com/img dengan melakukan konfigurasi apache dan juga menambahkan alias dan direktori `

Di brokoli :
 ```
Edit Apache Configuration
nano /etc/apache2/sites-available/vitamin.brokoli.c05.com.conf

Alias /img /var/www/vitamin.brokoli.c05/public/images/

<Directory /var/www/vitamin.brokoli.c05/public/images/>
    Options Indexes FollowSymLinks
    AllowOverride None
    Require all granted
</Directory>

# Restart  apache
service apache2 restart
 ```
TESTING (client)
 ```
lynx http://www.vitamin.brokoli.c05.com/img
 ```

<br>

## Soal 15 (REVISI)

> Karena terdapat resep rahasia di file /secret/recipe_secret.txt pada subdomain www.vitamin.brokoli.yyy.com, konfigurasikan folder /secret agar tidak dapat diakses oleh pengguna (dengan menampilkan 403 Forbidden).

> _Because there is a secret recipe in the /secret/recipe_secret.txt file on the www.vitamin.brokoli.yyy.com subdomain, configure the /secret folder so that it cannot be accessed by users (by displaying 403 Forbidden)._

**Answer:**

- Screenshot

![image](https://github.com/user-attachments/assets/9fa32e80-dced-46fb-ac7f-c879edf0223a)
![image](https://github.com/user-attachments/assets/407d2a1e-b30d-426a-abdd-e8aa90c6b240)


- Explanation

  `Terlihat subdomain http://www.vitamin.brokoli.c05.com/secret/recipe_secret.txt tidak dapat diakses, pada saat diakses menggunakan lynx maka menampilkan 403 Forbidden`

  <br>
  
  BrokoliWebServer
  
  Edit Apache Configuration
  
  `nano /etc/apache2/sites-available/vitamin.brokoli.c05.com.conf`

  ```
  #Tambahkan
  <Directory /var/www/vitamin.brokoli.c05/secret>
  	Require all denied
  </Directory>
  ```
  <br>
  Kemudian melakukan restart terhadap apache2

  `service restart apache2`

  TESTING di client

  `lynx http://www.vitamin.brokoli.c05.com/secret/recipe_secret.txt`


  
<br>

## Soal 16 (REVISI)

> Karena dinilai terlalu panjang coba ubah konfigurasi www.vitamin.brokoli.yyy.com/public/js menjadi www.vitamin.brokoli.yyy.com/js

> _Since it is considered too long, change the configuration from www.vitamin.brokoli.yyy.com/public/js to www.vitamin.brokoli.yyy.com/js._

**Answer:**

- Screenshot

![image](https://github.com/user-attachments/assets/9f04d60b-ad4b-48c7-a862-a1d0141c312e)
![image](https://github.com/user-attachments/assets/339f62d0-b28f-4b50-b213-e7dc4d1a22a4)


- Explanation

  `Terlihat sudah dapat dilakukan lynx pada url http://www.vitamin.brokoli.c05.com/js/script.js, mendandakan bahwa pengubahan konfigurasi telah berhasil`
  
  BrokoliWebServer
  
  Edit Apache Configuration
  `nano /etc/apache2/sites-available/vitamin.brokoli.c05.com.conf`
  
  ```
  #Tambahkan
  Alias /js /var/www/vitamin.brokoli.c05/public/js
  <Directory /var/www/vitamin.brokoli.c05/public/js>
  	Options Indexes FollowSymLinks
  	AllowOverride None
  	Require all granted
  </Directory>
  ```

Kemudian melakukan restart terhadap apache2

`service apache2 restart`

TESTING di client

`lynx http://www.vitamin.brokoli.c05.com/js/script.js`

<br>

## Soal 17 (REVISI)

> Supaya Web kita aman terkendali maka ubah konfigurasi www.k1.vitamin.brokoli.yyy.com menjadi hanya bisa di akses oleh port 9696 dan 8888

> _To keep our web secure, configure www.k1.vitamin.brokoli.yyy.com to only be accessible through ports 9696 and 8888._

**Answer:**

- Screenshot


![image](https://github.com/user-attachments/assets/7e456178-c180-442e-8a9c-7a4e8321be79)


- Explanation

  `Dapat dilihat bahwasanya subdomain brokoli yaitu wwww.k1.vitamin.brokoli.c05.com hanya dapat diakses dengan port 9696 serta 8888, hal itu dibuktikan pada saat kita melakukan test dengan curl`
  
  <br>
  
  BrokoliWebServer
  
  Download & Unzip
  `wget --no-check-certificate wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1SRnelY4XrtmhJg_Ly1nUJo1Jf91SnmtB' -O k1_vitamin_config.zip`

  `unzip k1_vitamin_config.zip -d /var/www/`

  `mv /var/www/k1.vitamin.brokoli.yyy.com /var/www/k1.vitamin.brokoli.c05`
  <br>
  
  `nano /etc/apache2/sites-available/k1.vitamin.brokoli.c05.conf`

  ```
  <VirtualHost *:9696 *:8888>
    ServerAdmin admin@k1.vitamin.brokoli.c05.com
    ServerName k1.vitamin.brokoli.c05.com
    ServerAlias www.k1.vitamin.brokoli.c05.com

    DocumentRoot /var/www/k1.vitamin.brokoli.c05

    ErrorLog ${APACHE_LOG_DIR}/vitamin.k1.brokoli.c05.error.log
    CustomLog ${APACHE_LOG_DIR}/vitamin.k1.brokoli.c05.access.log combined

    <Directory /var/www/k1.vitamin.brokoli.c05>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
  </VirtualHost>
  ```
  `nano /etc/apache2/ports.conf`
  
  `Listen 9696`
  
  `Listen 8888`
  <br>
  
  `nano /etc/hosts`
  `10.92.4.2   www.k1.vitamin.brokoli.c05.com k1.vitamin.brokoli.c05.com`
  <br>
  
  `a2ensite k1.vitamin.brokoli.c05.conf`
  <br>
  
  Kemudian melakukan restart terhadap apache2
  
  `service apache2 restart`

  TESTING di client
  
  `curl http://www.k1.vitamin.brokoli.c05.com:9696 `

  `curl http://www.k1.vitamin.brokoli.c05.com:8888`



<br>

## Soal 18 (REVISI)

> Lanjutkan dari nomor sebelumnya buatlah autentikasi dengan username “Seblak” dan password “sehatyyy” dengan yyy adalah kode kelompok. Letakkan Document Root pada /var/www/k1.vitamin.brokoli.yyy.

> _Continuing from the previous point, create authentication with the username “Seblak” and the password “sehatyyy” where yyy is the group code. Set the Document Root to /var/www/k1.vitamin.brokoli.yyy._

**Answer:**

- Screenshot
![image](https://github.com/user-attachments/assets/975356a8-92ec-4ee1-b7af-4a62c2899c66)
![image](https://github.com/user-attachments/assets/35c604c2-63f2-4e3d-8484-b051230afc4d)


- Explanation

  `Dapat dilihat bahwasanya dapat masuk dengan authorized username Seblak serta password sehatc05`

  BrokoliWebServer
  
  `nano  /etc/apache2/sites-available/k1.vitamin.brokoli.c05.conf`

  Tambahkan di bawahnya

  ```
  <Directory /var/www/k1.vitamin.brokoli.c05>
  	AuthType Basic
        AuthName "Restricted Content"
        AuthUserFile /etc/apache2/.htpasswd
        Require valid-user
  </Directory>
  ErrorLog ${APACHE_LOG_DIR}/k1.vitamin.brokoli.c05.error.log
  CustomLog ${APACHE_LOG_DIR}/k1.vitamin.brokoli.c05.access.log combined
  ```

  `htpasswd -c -b /etc/apache2/.htpasswd Seblak sehatc05`

  `a2ensite k1.vitamin.brokoli.c05.conf`

  Melakukan restart terhadap apache2

  `service apache2 restart`

  TESTINGb di client
  
  ```
  lynx http://www.k1.vitamin.brokoli.c05.com:9696
  lynx http://www.k1.vitamin.brokoli.c05.com:8888
  ```

  Cara masuknya
  
  `Klik enter > masukin username : Seblak > enter > Password : sehatc05`



<br>

## Soal 19 (REVISI)

> Konfigurasikan agar setiap kali IP Brokoli diakses dengan lynx, secara otomatis akan dialihkan ke www.brokoli.yyy.com (alias).

> _Configure it so that every time Brokoli's IP is accessed using lynx, it is automatically redirected to www.brokoli.yyy.com (alias)._

**Answer:**

- Screenshot

![image](https://github.com/user-attachments/assets/f574d270-849e-4afb-9e8a-3da28b4c09ce)

- Explanation

  `Terlihat pada saat ip brokoli di lynx/diakses maka dia akan langsung menuju ke wwww.brokoli.c05.com`
  
  
  BrokoliWebServer
  
  `nano /etc/apache2/sites-available/brokoli.c05.com.conf`
  ```
	<VirtualHost *:80>
	    ServerAdmin admin@brokoli.c05.com
	    ServerName brokoli.c05.com
	    ServerAlias www.brokoli.c05.com
	
	    # Redirect all requests to www.brokoli.yyy.com
	    Redirect 301 / http://www.brokoli.yyy.com/
	
	    DocumentRoot /var/www/brokoli.c05
	    ErrorLog ${APACHE_LOG_DIR}/brokoli.c05.error.log
	    CustomLog ${APACHE_LOG_DIR}/brokoli.c05.access.log combined
	</VirtualHost>
  ```


Aktifkan virtual host

`a2ensite brokoli.c05.com.conf`

Melakukan restart terhadap apache2

`service apache2 restart`

TESTING di client

`lynx http://10.92.4.2`


<br>

## Soal 20 (REVISI)

> Karena jumlah pengunjung website www.vitamin.brokoli.yyy.com semakin meningkat dan terdapat banyak gambar random, ubah permintaan gambar yang mengandung substring "vitamin" agar diarahkan ke file vitamin.png.

> _Since the number of visitors to www.vitamin.brokoli.yyy.com is increasing and there are many random images, redirect image requests that contain the substring "vitamin" to the file vitamin.png._

**Answer:**

- Screenshot


![image](https://github.com/user-attachments/assets/828c97e4-60ae-4789-a9e5-94b2e538bd1b)
![image](https://github.com/user-attachments/assets/212ac345-af3f-4124-8b0a-e9b72cc65818)


- Explanation

  `URL http://www.vitamin.brokoli.c05.com/img/somevitaminimage.jpg sudah dapat diakses, dibuktikan pada saat dicoba dengan lynx http://www.vitamin.brokoli.c05.com/img/somevitaminimage.jpg`

  BrokoliWebServer
  
  `nano /etc/apache2/sites-available/vitamin.brokoli.c05.com.conf`

  Hapus semua, kemudian masukkan di bawah ini
  
```
	  <VirtualHost *:80>
	    ServerAdmin admin@vitamin.brokoli.c05.com
	    ServerName vitamin.brokoli.c05.com
	    ServerAlias www.vitamin.brokoli.c05.com
	
	    DocumentRoot /var/www/vitamin.brokoli.c05
	
	    <Directory /var/www/vitamin.brokoli.c05>
	        Options Indexes FollowSymLinks
	        AllowOverride All
	        Require all granted
	    </Directory>
	
	    # Rewrite rule to redirect requests containing 'vitamin' in the image name
	    RewriteEngine On
	    RewriteCond %{REQUEST_URI} ^.*vitamin.*\.(jpg|png|jpeg|gif)$ [NC]
	    RewriteRule ^.*$ /vitamin.png [L]
	
	    ErrorLog ${APACHE_LOG_DIR}/vitamin.brokoli.c05.error.log
	    CustomLog ${APACHE_LOG_DIR}/vitamin.brokoli.c05.access.log combined
	</VirtualHost>
```

Tempatkan file png ke DocumentRoot

`cp /var/www/vitamin.brokoli.c05/public/images/vitamin.png /var/www/vitamin.brokoli.c05/`

Kemudian melakukan restart terhadap apache2

`service apache2 restart`

Uji aturan rewrite ini dengan mengakses gambar yang memiliki substring "vitamin" di dalam nama file-nya. Gunakan lynx atau browser lain untuk mengakses URL

`lynx http://www.vitamin.brokoli.c05.com/img/somevitaminimage.jpg`

<br>
  
## Problems
Masih kesusahan konfigurasi di bagian web server.

## Revisions (if any)
NO 9-20 REVISI
