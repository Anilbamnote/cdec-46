#!/bin/bash
yum install httpd -y
systemctl start httpd
systmectl enable httpd
mkdir /var/www/html/mobile
echo "<h1> SALE SALE SALE on mobile Page" > /var/www/html/mobile/index.html
