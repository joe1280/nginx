#!/bin/bash
yum -y install git lrzsz unzip
wget https://github.com/joe1280/nginx/raw/master/phpredis-develop.zip
unzip phpredis-develop.zip
cd phpredis-develop
/www/wdlinux/php/bin/phpize
./configure --with-php-config=/www/wdlinux/php/bin/php-config
make && make install
#cp /www/wdlinux/php/lib/php/extensions/no-debug-non-zts-20131226/redis.so /www/wdlinux/php/lib/php/extensions/
echo 'extension=redis.so' >> /www/wdlinux/php/etc/php.ini 
#echo 'extension_dir=/www/wdlinux/nginx_php-5.6.21/lib/php/extensions/no-debug-non-zts-20131226' >> /www/wdlinux/php/etc/php.ini 
service nginxd restart
service php-fpm reload
