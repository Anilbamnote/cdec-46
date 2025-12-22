#!/bin/bash
yum install httpd -y
systemctl start httpd
systmectl enable httpd
echo "<h1> Hello World </h1> <br> <h2> Welcome to Cloudblitz </h2>" > /var/www/html/index.html
