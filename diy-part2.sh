#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify the IP of the Openwrt's lan port
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

# Delete 'exit 0' at the end of the 'zzz-default-settings' file
sed -i '/exit 0/d' package/lean/default-settings/files/zzz-default-settings

# Modify the interface and IP of the Openwrt's wan port
echo "#修改wan为静态地址\"192.168.2.200\"&修改物理接口为\"eth2\"" > temp_file
echo "sed -i '/wan/,\$d' /etc/config/network" >> temp_file
echo "echo \"config interface 'wan'\" >> /etc/config/network" >> temp_file
echo "echo \" 	 option ifname 'eth2'\" >> /etc/config/network" >> temp_file
echo "echo \" 	 option proto 'static'\" >> /etc/config/network" >> temp_file
echo "echo \" 	 option ipaddr '192.168.2.200'\" >> /etc/config/network" >> temp_file
echo "echo \" 	 option netmask '255.255.255.0'\" >> /etc/config/network" >> temp_file
echo "echo \" 	 option gateway '192.168.2.1'\" >> /etc/config/network" >> temp_file
echo "echo \" 	 option dns '192.168.2.1'\" >> /etc/config/network" >> temp_file
cat temp_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm temp_file

# Modify wan3 interface to WAN area
# echo "#修改wan3接口为WAN区域" > area_file
# echo "sed -i \"s/list network 'wan'/list network 'wan3'/\" /etc/config/firewall" > area_file
# cat area_file >> package/lean/default-settings/files/zzz-default-settings
# echo "" >> package/lean/default-settings/files/zzz-default-settings
# rm area_file

# Add port forwarding for Openwrt
echo "#增加外网访问Openwrt的转发端口为\"1216\"" > port_file
echo "echo 'config redirect' >> /etc/config/firewall" >> port_file
echo "echo \" 	 option target 'DNAT'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src 'wan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest 'lan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option proto 'tcp udp'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src_dport '1216'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_ip '192.168.2.1'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_port '80'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option name 'Internet'\" >> /etc/config/firewall" >> port_file
cat port_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm port_file

# Add port forwarding for Openwrt-SSH
echo "#增加外网访问Openwrt-SSH的转发端口为\"222\"" > port_file
echo "echo 'config redirect' >> /etc/config/firewall" >> port_file
echo "echo \" 	 option target 'DNAT'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src 'wan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest 'lan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option proto 'tcp udp'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src_dport '222'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_ip '192.168.2.1'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_port '222'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option name 'SSH'\" >> /etc/config/firewall" >> port_file
cat port_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm port_file

# Add port forwarding for Openwrt-TTYD
echo "#增加外网访问Openwrt-TTYD的转发端口为\"7681\"" > port_file
echo "echo 'config redirect' >> /etc/config/firewall" >> port_file
echo "echo \" 	 option target 'DNAT'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src 'wan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest 'lan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option proto 'tcp udp'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src_dport '7681'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_ip '192.168.2.1'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_port '7681'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option name 'TTYD'\" >> /etc/config/firewall" >> port_file
cat port_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm port_file

# Add port forwarding for Openwrt-Openclash
echo "#增加外网访问Openwrt-Openclash的转发端口为\"9090\"" > port_file
echo "echo 'config redirect' >> /etc/config/firewall" >> port_file
echo "echo \" 	 option target 'DNAT'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src 'wan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest 'lan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option proto 'tcp udp'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src_dport '9090'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_ip '192.168.2.1'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_port '9090'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option name 'Openclash'\" >> /etc/config/firewall" >> port_file
cat port_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm port_file

# Add port forwarding for Openwrt-Transmission
echo "#增加外网访问Openwrt-Transmission的转发端口为\"9091\"" > port_file
echo "echo 'config redirect' >> /etc/config/firewall" >> port_file
echo "echo \" 	 option target 'DNAT'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src 'wan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest 'lan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option proto 'tcp udp'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src_dport '9091'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_ip '192.168.2.1'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_port '9091'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option name 'Transmission'\" >> /etc/config/firewall" >> port_file
cat port_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm port_file

# Add port forwarding for Openwrt-qBittorrent
echo "#增加外网访问Openwrt-qBittorrent的转发端口为\"8181\"" > port_file
echo "echo 'config redirect' >> /etc/config/firewall" >> port_file
echo "echo \" 	 option target 'DNAT'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src 'wan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest 'lan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option proto 'tcp udp'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src_dport '8181'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_ip '192.168.2.1'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_port '8080'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option name 'qBittorrent'\" >> /etc/config/firewall" >> port_file
cat port_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm port_file

# Add port forwarding for Openwrt-Aria2
echo "#增加外网访问Openwrt-Aria2的转发端口为\"6800\"" > port_file
echo "echo 'config redirect' >> /etc/config/firewall" >> port_file
echo "echo \" 	 option target 'DNAT'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src 'wan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest 'lan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option proto 'tcp udp'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src_dport '6800'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_ip '192.168.2.1'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_port '6800'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option name 'Aria2'\" >> /etc/config/firewall" >> port_file
cat port_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm port_file

# Add port forwarding for Openwrt-Xupnpd
echo "#增加外网访问Openwrt-Xupnpd的转发端口为\"4044\"" > port_file
echo "echo 'config redirect' >> /etc/config/firewall" >> port_file
echo "echo \" 	 option target 'DNAT'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src 'wan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest 'lan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option proto 'tcp udp'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src_dport '4044'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_ip '192.168.2.1'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_port '4044'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option name 'Xupnpd'\" >> /etc/config/firewall" >> port_file
cat port_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm port_file

# Add port forwarding for Openwrt-Alist
echo "#增加外网访问Openwrt-Alist的转发端口为\"5244\"" > port_file
echo "echo 'config redirect' >> /etc/config/firewall" >> port_file
echo "echo \" 	 option target 'DNAT'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src 'wan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest 'lan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option proto 'tcp udp'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src_dport '5244'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_ip '192.168.2.1'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_port '5244'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option name 'Alist'\" >> /etc/config/firewall" >> port_file
cat port_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm port_file

# Add port forwarding for ESXI
echo "#增加外网访问ESXI的转发端口为\"9443\"" > port_file
echo "echo 'config redirect' >> /etc/config/firewall" >> port_file
echo "echo \" 	 option target 'DNAT'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src 'wan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest 'lan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option proto 'tcp'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src_dport '9443'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_ip '192.168.2.2'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_port '443'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option name 'ESXI'\" >> /etc/config/firewall" >> port_file
cat port_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm port_file

# Add port forwarding for ESXI
echo "#增加外网访问ESXI运行窗的转发端口为\"902\"" > port_file
echo "echo 'config redirect' >> /etc/config/firewall" >> port_file
echo "echo \" 	 option target 'DNAT'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src 'wan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest 'lan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option proto 'tcp'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src_dport '902'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_ip '192.168.2.2'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_port '902'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option name 'ESXI'\" >> /etc/config/firewall" >> port_file
cat port_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm port_file

# Add port forwarding for ESXI-SSH
echo "#增加外网访问ESXI-SSH的转发端口为\"223\"" > port_file
echo "echo 'config redirect' >> /etc/config/firewall" >> port_file
echo "echo \" 	 option target 'DNAT'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src 'wan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest 'lan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option proto 'tcp'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src_dport '223'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_ip '192.168.2.2'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_port '22'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option name 'ESXI-SSH'\" >> /etc/config/firewall" >> port_file
cat port_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm port_file

# Add port forwarding for Ubuntu
echo "#增加外网访问Ubuntu的转发端口为\"2222\"" > port_file
echo "echo 'config redirect' >> /etc/config/firewall" >> port_file
echo "echo \" 	 option target 'DNAT'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src 'wan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest 'lan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option proto 'tcp udp'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src_dport '2222'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_ip '192.168.2.187'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_port '22'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option name 'Ubuntu'\" >> /etc/config/firewall" >> port_file
cat port_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm port_file

# Add port forwarding for Synology
echo "#增加外网访问Synology的转发端口为\"5000\"" > port_file
echo "echo 'config redirect' >> /etc/config/firewall" >> port_file
echo "echo \" 	 option target 'DNAT'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src 'wan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest 'lan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option proto 'tcp udp'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src_dport '5000'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_ip '192.168.2.173'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_port '5000'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option name 'Synology'\" >> /etc/config/firewall" >> port_file
cat port_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm port_file

# Add port forwarding for Synology-Transmission
echo "#增加外网访问Synology-Transmission的转发端口为\"9092\"" > port_file
echo "echo 'config redirect' >> /etc/config/firewall" >> port_file
echo "echo \" 	 option target 'DNAT'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src 'wan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest 'lan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option proto 'tcp udp'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src_dport '9092'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_ip '192.168.2.173'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_port '9091'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option name 'Synology-Transmission'\" >> /etc/config/firewall" >> port_file
cat port_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm port_file

# Add port forwarding for test-Openwrt
echo "#增加外网访问test-Openwrt的转发端口为\"1217\"" > port_file
echo "echo 'config redirect' >> /etc/config/firewall" >> port_file
echo "echo \" 	 option target 'DNAT'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src 'wan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest 'lan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option proto 'tcp udp'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src_dport '1217'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_ip '192.168.5.1'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_port '80'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option name 'test-Internet'\" >> /etc/config/firewall" >> port_file
cat port_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm port_file

# Add port forwarding for test-Openwrt(Internet)
echo "#增加外网访问test-Openwrt的转发端口为\"1217\"" > port_file
echo "echo 'config redirect' >> /etc/config/firewall" >> port_file
echo "echo \" 	 option target 'DNAT'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src 'wan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest 'lan'\" >> /etc/config/firewall" >> port_file
#echo "echo \" 	 option proto 'tcp udp'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src_dport '1217'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_ip '192.168.2.200'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_port '1217'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option name 'wan-test-Internet'\" >> /etc/config/firewall" >> port_file
cat port_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm port_file

# Add port forwarding for Openwrt-test-SSH
echo "#增加外网访问Openwrt-test-SSH的转发端口为\"2233\"" > port_file
echo "echo 'config redirect' >> /etc/config/firewall" >> port_file
echo "echo \" 	 option target 'DNAT'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src 'wan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest 'lan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option proto 'tcp udp'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src_dport '2233'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_ip '192.168.5.1'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_port '222'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option name 'test-SSH'\" >> /etc/config/firewall" >> port_file
cat port_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm port_file

# Add port forwarding for Openwrt-test-SSH(Internet)
echo "#增加外网访问Openwrt-test-SSH的转发端口为\"2233\"" > port_file
echo "echo 'config redirect' >> /etc/config/firewall" >> port_file
echo "echo \" 	 option target 'DNAT'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src 'wan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest 'lan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option proto 'tcp udp'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src_dport '2233'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_ip '192.168.2.200'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_port '2233'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option name 'wan-test-SSH'\" >> /etc/config/firewall" >> port_file
cat port_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm port_file

# Add port forwarding for Openwrt-test-Transmission
echo "#增加外网访问Openwrt-test-Transmission的转发端口为\"9093\"" > port_file
echo "echo 'config redirect' >> /etc/config/firewall" >> port_file
echo "echo \" 	 option target 'DNAT'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src 'wan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest 'lan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option proto 'tcp udp'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src_dport '9093'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_ip '192.168.5.1'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_port '9091'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option name 'test-Transmission'\" >> /etc/config/firewall" >> port_file
cat port_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm port_file

# Add port forwarding for Openwrt-test-Transmission(Internet)
echo "#增加外网访问Openwrt-test-Transmission的转发端口为\"9093\"" > port_file
echo "echo 'config redirect' >> /etc/config/firewall" >> port_file
echo "echo \" 	 option target 'DNAT'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src 'wan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest 'lan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option proto 'tcp udp'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src_dport '9093'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_ip '192.168.2.200'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_port '9093'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option name 'wan-test-Transmission'\" >> /etc/config/firewall" >> port_file
cat port_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm port_file

# Add port forwarding for Openwrt-test-qBittorrent
echo "#增加外网访问Openwrt-test-qBittorrent的转发端口为\"8282\"" > port_file
echo "echo 'config redirect' >> /etc/config/firewall" >> port_file
echo "echo \" 	 option target 'DNAT'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src 'wan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest 'lan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option proto 'tcp udp'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src_dport '8080'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_ip '192.168.5.1'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_port '8080'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option name 'test-qBittorrent'\" >> /etc/config/firewall" >> port_file
cat port_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm port_file

# Add port forwarding for Openwrt-test-qBittorren(Internet)
echo "#增加外网访问Openwrt-test-qBittorrent的转发端口为\"8282\"" > port_file
echo "echo 'config redirect' >> /etc/config/firewall" >> port_file
echo "echo \" 	 option target 'DNAT'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src 'wan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest 'lan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option proto 'tcp udp'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src_dport '8282'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_ip '192.168.2.200'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_port '8080'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option name 'wan-test-qBittorrent'\" >> /etc/config/firewall" >> port_file
cat port_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm port_file

# Open wan's port for Openwrt-Transmission
echo "#打开Openwrt-Transmission的端口为\"51413\"" > port_file
echo "echo 'config rule' >> /etc/config/firewall" >> port_file
echo "echo \" 	 option target 'ACCEPT'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option src 'wan'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option proto 'tcp udp'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option dest_port '51413'\" >> /etc/config/firewall" >> port_file
echo "echo \" 	 option name 'Transmission-DL'\" >> /etc/config/firewall" >> port_file
cat port_file >> package/lean/default-settings/files/zzz-default-settings
echo "" >> package/lean/default-settings/files/zzz-default-settings
rm port_file

# Fix Transmission-web-control
# echo "#修复Transmission-web-control" > fix_file
# echo "sed -i 's#procd_add_jail transmission log#procd_add_jail_mount \"$web_home\"#g' /etc/init.d/transmission" >> fix_file
# cat fix_file >> package/lean/default-settings/files/zzz-default-settings
# echo "" >> package/lean/default-settings/files/zzz-default-settings
# rm fix_file

# Modify Openwrt's release
sed -i 's/R24.8.1/R24.8.1 (Compiled by Kisoul on 08.20.2024)/g' package/lean/default-settings/files/zzz-default-settings

# Write 'exit 0' at the end of the 'zzz-default-settings' file
echo "exit 0" > fix_file
cat fix_file >> package/lean/default-settings/files/zzz-default-settings
rm fix_file

# Fix the conflict between lede and small-package
rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd-alt,miniupnpd-iptables,wireless-regdb,transmission-web-control,transmission,luci-app-transmission,aria2,ariang,qbittorrent,luci-app-qbittorrent}
