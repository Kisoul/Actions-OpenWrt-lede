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

# Modify default IP
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate
# Modify default DISTRIB_REVISION
sed -i 's/R23.11.11/R23.11.11 (Compiled by Kisoul on 12.05.2023)/g' package/lean/default-settings/files/zzz-default-settings
# Delte "exit 0"
sed -i '/exit 0/d' package/lean/default-settings/files/zzz-default-settings
# Fix Transmission-web-control
echo "#修复Transmission-web-control" > fix_file
echo "sed -i 's#procd_add_jail transmission log#procd_add_jail_mount \"$web_home\"#g' /etc/init.d/transmission" >> fix_file
cat fix_file >> package/lean/default-settings/files/zzz-default-settings
rm fix_file
# Modify Openwrt's Port Forward
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
rm temp_file
# Write in "exit 0"
echo "exit 0" > new_file
cat new_file >> package/lean/default-settings/files/zzz-default-settings
rm new_file
# Fix the conflict between lede and small-package
rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd-alt,miniupnpd-iptables,wireless-regdb}

