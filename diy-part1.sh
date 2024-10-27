#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate

#十二、几个修改项
#更改设备名为“N4505”
sed -i "s/hostname='OpenWrt'/hostname='N4505'/g" package/base-files/files/bin/config_generate

#修改默认主题
sed -i 's/bootstrap/argon/g' ./feeds/luci/collections/luci/Makefile

#设置管理密码为空
#sed -i 's/CYXluq4wUazHjmCDBCqXF/g' package/base-files/files/etc/shadow


#设置TTYD登录无需密码
sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config

#设置管理密码为438516
sed -i 's/root:$1$Tp0WlehU$7fTieRPHm4ie41xa22r9T/:19673:0:99999:7:::/g' package/base-files/files/etc/shadow

