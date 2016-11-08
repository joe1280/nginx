#!/bin/bash
yum -y install git lrzsz unzip
wget https://github.com/joe1280/nginx/raw/master/phpredis-develop.zip
unzip phpredis-develop.zip
cd phpredis-develop
/www/wdlinux/php/bin/phpize
./configure --with-php-config=/www/wdlinux/php/bin/php-config
make && make install
echo 'extension=redis.so' >> /www/wdlinux/php/etc/php.ini 
service nginxd restart
service php-fpm reload
