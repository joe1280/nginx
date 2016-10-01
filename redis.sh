#!/bin/bash
wget --no-check-certificate  http://download.redis.io/releases/redis-3.2.4.tar.gz
tar xzvf redis-3.2.4.tar.gz
cd  redis-3.2.4
make  
mkdir /usr/local/redis
cp src/redis* /usr/local/redis/
cp redis.conf /usr/local/redis/
/usr/local/redis/redis-server redis.conf &
