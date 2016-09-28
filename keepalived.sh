#!/bin/bash
#这个是keeplive的安装脚本
yum install -y gcc openssl-devel popt-devel
wget  --no-check-certificate  https://github.com/joe1280/nginx/raw/master/keepalived-1.2.24.tar.gz
tar zxvf keepalived-1.2.7.tar.gz
cd keepalived-1.2.7
./configure
make && make install 
cp /usr/local/etc/rc.d/init.d/keepalived /etc/init.d/
cp /usr/local/etc/sysconfig/keepalived /etc/sysconfig/
chmod +x /etc/init.d/keepalived
chkconfig --add keepalived
chkconfig keepalived on
mkdir /etc/keepalived
ln -s /usr/local/sbin/keepalived /usr/sbin/
