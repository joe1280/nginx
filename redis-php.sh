#/bin/bash
yum install git
git clone https://github.com/phpredis/phpredis.git
cd phpredis
/usr/local/php/bin/phpize
./configure --with-php-config=/usr/local/php/bin/php-config
make && make install
cp /usr/local/php/lib/php/extensions/no-debug-non-zts-20100525/redis.so /usr/local/php/lib/php/extensions/
echo 'extension=redis.so' >> /usr/local/php/etc/php.ini 
service nginx restart
service php-fpm reload