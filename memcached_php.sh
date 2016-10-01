#!/bin/bash
wget  --no-check-certificate https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz
tar xzvf libmemcached-1.0.18.tar.gz
cd libmemcached-1.0.18
./configure -prefix=/usr/local/libmemcached -with-memcached
make && make install
yum install php-devel
wget --no-check-certificate http://pecl.php.net/get/memcached-2.2.0.tgz
tar xzvf memcached-2.2.0.tgz
cd memcached-2.2.0
/usr/local/php/bin/phpize
./configure --disable-memcached-sasl -enable-memcached -with-php-config=/usr/local/php/bin/php-config -with-zlib-dir -with-libmemcached-dir=/usr/local/libmemcached -prefix=/usr/local/phpmemcached
make && make install 
cp /usr/local/php/lib/php/extensions/no-debug-non-zts-20100525/memcached.so /usr/local/php/lib/php/extension/
echo 'extension=memcached.so' >> /usr/local/php/etc/php.ini
service nginx restart
service php-fpm reload
