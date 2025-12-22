#!/bin/bash
yum install httpd -y
systemctl start httpd
systmectl enable httpd
mkdir /var/www/html/laptop
echo "<h1> This is Laptop Page" > /var/www/html/laptop/index.html
