ulimit -SHn 65535
cat /etc/hosts|grep controller || cat hosts >>/etc/hosts
[ -n "$controllerIP" ] &&  sed -i  "s#html5proxy_base_url.*#html5proxy_base_url = http://$controllerIP:6082/spice_auto.html#" /etc/nova/nova.conf
[ -n "$computeIP" ] && sed -i "s/my_ip.*=.*/my_ip = $computeIP/" /etc/nova/nova.conf && \
[ -n "$virt_type" ] && sed -i "s/virt_type=.*/virt_type = $virt_type/"  /etc/nova/nova-compute.conf && \
su -s /bin/bash nova -c "/etc/init.d/nova-compute systemd-start &"
sleep 5
tail -f  /var/log/nova/nova-*log
