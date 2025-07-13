#!/bin/bash

# Update and upgrade system
sudo apt update && sudo apt upgrade -y

# Install Apache, PHP, MySQL client, and required PHP extensions
sudo apt install apache2 php php-mysql libapache2-mod-php php-cli php-cgi php-gd php-xml php-mbstring php-curl mysql-client unzip wget -y

# Restart Apache to apply changes
sudo systemctl restart apache2

# Download and configure WordPress
cd /var/www/html
sudo wget https://wordpress.org/latest.zip
sudo unzip latest.zip
sudo cp -r wordpress/* .
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html
