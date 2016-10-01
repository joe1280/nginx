#!/bin/bash
wget -c http://soft.vpser.net/lnmp/lnmp1.3-full.tar.gz && tar zxf lnmp1.3-full.tar.gz && cd lnmp1.3-full && ./install.sh lnmp 
wget --no-check-certificate https://raw.githubusercontent.com/joe1280/nginx/master/memcached-memcached_php.sh && bash memcached-memcached_php.sh