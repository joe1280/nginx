#/bin/bash
yum -y install gcc automake make pam-devel openldap-devel cyrus-sasl-devel
wget --no-check-certificate  http://iweb.dl.sourceforge.net/project/ss5/ss5/3.8.9-6/ss5-3.8.9-6.tar.gz
tar -xzvf ss5-3.8.9-6.tar.gz
cd ss5-3.8.9
./configure && make && make install
cd /etc/opt/ss5
rm -rf ss5.conf ss5.passwd
wget --no-check-certificate https://github.com/joe1280/nginx/raw/master/ss5.conf
wget --no-check-certificate https://github.com/joe1280/nginx/raw/master/ss5.passwd
chmod 777 /etc/rc.d/init.d/ss5
/etc/init.d/ss5 start
chkconfig --add ss5
chkconfig ss5 on
iptables -A INPUT -p tcp --dport 1080 -j ACCEPT
service iptables save
service iptables restart
service ss5 restart