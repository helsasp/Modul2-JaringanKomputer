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


- Explanation

  `web server bayam berhasil ping ke sub domain vitamin yaitu k1.vitamin.brokoli.c05.com`

  ![image](https://github.com/user-attachments/assets/d2ac9235-7c1c-41f6-9287-d6d1d0fa3d2d)


<br>

## Soal 9

> Bayam, Brokoli, dan Buncis masing-masing berfungsi sebagai web server nginx yang menyajikan resep khusus untuk jenis sayuran yang mereka tangani. Untuk mengaktifkan web server pada masing-masing worker, lakukan deployment website menggunakan sumber yang tersedia di sayur_webserver_nginx. Tambahkan konfigurasi untuk log error ke file /var/log/nginx/error.log dan log access ke file /var/log/nginx/access.log.

> _Bayam, Brokoli, and Buncis each function as nginx web servers that serve special recipes for the type of vegetables they handle. To activate the web server on each worker, do the deployment using the resources available in sayur_webserver_nginx. Add configuration for error log to the file /var/log/nginx/error.log and access log to the file /var/log/nginx/access.log._

**Answer:**

- Screenshot

  ![image](https://github.com/user-attachments/assets/67256973-ec4c-49e3-9810-aedff900d0a9)
![image](https://github.com/user-attachments/assets/1a46c32d-5447-4437-bbd0-f7f6a940e86e)


- Explanation

  `Put your explanation in here`

<br>

## Soal 10

> Pada masing masing worker nginx, akan terdapat beberapa hal yang perlu diperbaiki pada resource yang diberikan untuk bisa menampilkan resep saat halaman dimuat. Analisis kesalahan yang ada di resource melalui file /var/log/nginx/error.log dan perbaiki hingga halaman bisa menampilkan resep sesuai dengan worker nya.

> _On each nginx worker, there will be several things that need to be fixed in the resources provided to be able to display recipes when the page is loaded. Analyze the errors in the resource through the /var/log/nginx/error.log file and fix it until the page can display recipes according to its worker._

**Answer:**

- Screenshot


![image](https://github.com/user-attachments/assets/3aaba300-0f8b-4e57-90b4-b07bac5323d3)

![image](https://github.com/user-attachments/assets/f4cb7d51-92b9-46af-a92f-fb99535e6f31)
![image](https://github.com/user-attachments/assets/94722a74-71a4-4c83-afce-90e535d5a374)


- Explanation

  `Put your explanation in here`

<br>

## Soal 11

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

  `Put your screenshot in here`

- Explanation

  `Put your explanation in here`

<br>

## Soal 12

> Informasi vitamin pada sayur brokoli akan ditampilkan pada subdomain vitamin.brokoli.yyy.com di node brokoli, buatlah DocumentRoot yang disimpan pada /var/www/vitamin.brokoli.yyy. Konfigurasikan webserver dengan nama server vitamin.brokoli.yyy.com dan server alias www.vitamin.brokoli.yyy.com. Lakukan konfigurasi Apache Web Server pada Brokoli dengan menggunakan sumber yang tersedia di [sini](https://docs.google.com/uc?export=download&id=1QbGkKXo3jt4c68AdVAkl1hD4LolTUPg2).

> _For information on vitamins in brokoli will be displayed on the vitamin.brokoli.yyy.com subdomain on the brokoli node, create a DocumentRoot stored in /var/www/vitamin.brokoli.yyy. Configure the web server with the server name vitamin.brokoli.yyy.com and server alias www.vitamin.brokoli.yyy.com. Configure the Apache Web Server on Brokoli using [this resource](https://docs.google.com/uc?export=download&id=1QbGkKXo3jt4c68AdVAkl1hD4LolTUPg2)._

**Answer:**

- Screenshot

  `Put your screenshot in here`

- Explanation

  `Put your explanation in here`

<br>

## Soal 13

> Pada subdomain vitamin.brokoli.yyy.com, terdapat subfolder /nutrisi yang menyediakan informasi tentang berbagai vitamin dalam brokoli, seperti Vitamin A, C, dan K. Aktifkan directory listing untuk folder /nutrisi, dan buatlah rewrite rule di Apache untuk memperbaiki URL agar halaman seperti www.vitamin.brokoli.yyy.com/nutrisi/vitamin_a.php dapat diakses hanya dengan www.vitamin.brokoli.yyy.com/nutrisi/vitamin_a. Pastikan setiap halaman vitamin dapat diakses langsung melalui url yang telah disederhanakan.

> _On the vitamin.brokoli.yyy.com subdomain, there is a /nutrisi subfolder that provides information about various vitamins in brokoli, such as Vitamin A, C, and K. Activate directory listing for the /nutrisi folder, and create a rewrite rule in Apache to fix the URL so that pages like www.vitamin.brokoli.yyy.com/nutrisi/vitamin_a.php can be accessed only with www.vitamin.brokoli.yyy.com/nutrisi/vitamin_a. Make sure each vitamin page can be accessed directly through the simplified url._

**Answer:**

- Screenshot

  `Put your screenshot in here`

- Explanation

  `Put your explanation in here`

<br>

## Soal 14

> Tambahkan alias untuk folder /public/images/ pada subdomain www.vitamin.brokoli.yyy.com agar folder tersebut dapat diakses langsung melalui url www.vitamin.brokoli.yyy.com/img.

> _Add an alias for the /public/images/ folder on the www.vitamin.brokoli.yyy.com subdomain so that the folder can be accessed directly through the url www.vitamin.brokoli.yyy.com/img._

**Answer:**

- Screenshot

  `Put your screenshot in here`

- Explanation

  `Put your explanation in here`

<br>

## Soal 15

> Karena terdapat resep rahasia di file /secret/recipe_secret.txt pada subdomain www.vitamin.brokoli.yyy.com, konfigurasikan folder /secret agar tidak dapat diakses oleh pengguna (dengan menampilkan 403 Forbidden).

> _Because there is a secret recipe in the /secret/recipe_secret.txt file on the www.vitamin.brokoli.yyy.com subdomain, configure the /secret folder so that it cannot be accessed by users (by displaying 403 Forbidden)._

**Answer:**

- Screenshot

  `Put your screenshot in here`

- Explanation

  `Put your explanation in here`

<br>

## Soal 16

> Karena dinilai terlalu panjang coba ubah konfigurasi www.vitamin.brokoli.yyy.com/public/js menjadi www.vitamin.brokoli.yyy.com/js

> _Since it is considered too long, change the configuration from www.vitamin.brokoli.yyy.com/public/js to www.vitamin.brokoli.yyy.com/js._

**Answer:**

- Screenshot

  `Put your screenshot in here`

- Explanation

  `Put your explanation in here`

<br>

## Soal 17

> Supaya Web kita aman terkendali maka ubah konfigurasi www.k1.vitamin.brokoli.yyy.com menjadi hanya bisa di akses oleh port 9696 dan 8888

> _To keep our web secure, configure www.k1.vitamin.brokoli.yyy.com to only be accessible through ports 9696 and 8888._

**Answer:**

- Screenshot

  `Put your screenshot in here`

- Explanation

  `Put your explanation in here`

<br>

## Soal 18

> Lanjutkan dari nomor sebelumnya buatlah autentikasi dengan username “Seblak” dan password “sehatyyy” dengan yyy adalah kode kelompok. Letakkan Document Root pada /var/www/k1.vitamin.brokoli.yyy.

> _Continuing from the previous point, create authentication with the username “Seblak” and the password “sehatyyy” where yyy is the group code. Set the Document Root to /var/www/k1.vitamin.brokoli.yyy._

**Answer:**

- Screenshot

  `Put your screenshot in here`

- Explanation

  `Put your explanation in here`

<br>

## Soal 19

> Konfigurasikan agar setiap kali IP Brokoli diakses dengan lynx, secara otomatis akan dialihkan ke www.brokoli.yyy.com (alias).

> _Configure it so that every time Brokoli's IP is accessed using lynx, it is automatically redirected to www.brokoli.yyy.com (alias)._

**Answer:**

- Screenshot

  `Put your screenshot in here`

- Explanation

  `Put your explanation in here`

<br>

## Soal 20

> Karena jumlah pengunjung website www.vitamin.brokoli.yyy.com semakin meningkat dan terdapat banyak gambar random, ubah permintaan gambar yang mengandung substring "vitamin" agar diarahkan ke file vitamin.png.

> _Since the number of visitors to www.vitamin.brokoli.yyy.com is increasing and there are many random images, redirect image requests that contain the substring "vitamin" to the file vitamin.png._

**Answer:**

- Screenshot

  `Put your screenshot in here`

- Explanation

  `Put your explanation in here`

<br>
  
## Problems
lots of problems actually

## Revisions (if any)
