#!/bin/bash
#安装gcc 编译器
yum -y install gcc
yum -y install gcc-c++
 #安装memcached 依懒包 libevent
wget --no-check-certificate https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz
tar xzvf libevent-2.0.22-stable.tar.gz
cd libevent-2.0.22-stable
./configure --prefix=/usr
make && make install
#安装 memcached 服务器端
wget --no-check-certificate  http://www.memcached.org/files/memcached-1.4.31.tar.gz
tar xzvf memcached-1.4.31.tar.gz
cd memcached-1.4.31
./configure --with-libevent=/usr
make && make install
