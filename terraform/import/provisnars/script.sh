#!/bin/bash
yum install httpd -y
systemctl start httpd
touch file123