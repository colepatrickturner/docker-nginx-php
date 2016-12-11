#!/bin/sh

# install V8JS
apt-add-repository -y ppa:pinepain/php
apt-get update -y
apt-get install -y libv8-5.4-dev


# install dependencies
apt-get install -y git

# install PHPv8
cd /tmp
git clone https://github.com/phpv8/v8js.git
cd v8js
phpize
./configure
make
make install

# Enable extension
echo "extension=v8js.so" >> /etc/php/7.0/mods-available/v8js.ini
phpenmod v8js
