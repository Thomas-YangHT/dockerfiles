ulimit -SHn 65535
cat /etc/hosts|grep controller || cat hosts >>/etc/hosts
/usr/sbin/apachectl start 
sleep 20
tail -f /var/log/apache2/keystone.log /var/log/openstack-dashboard/*.log  /var/log/apache2/error.log
