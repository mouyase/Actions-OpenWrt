#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# 修改默认IP为192.168.5.1
sed -i 's/lan) ipad=${ipaddr:-"192.168.1.1"} ;;/lan) ipad=${ipaddr:-"192.168.5.1"} ;;/' package/base-files/files/bin/config_generate

# 修改默认使用dnsmasq-full
sed -i 's/dnsmasq/dnsmasq-full/' include/target.mk

# 修改rom信息
# sed -i 's/VERSION_DIST:=$(if $(VERSION_DIST),$(VERSION_DIST),OpenWrt)/VERSION_DIST:=$(if $(VERSION_DIST),$(VERSION_DIST),Yojigen OpenWrt)/' include/version.mk

# 修改时间校准服务器和时区
sed -i "s/set system.@system[-1].timezone='UTC'/set system.@system[-1].timezone='Asia\/Shanghai'/" package/base-files/files/bin/config_generate
sed -i "s/0.openwrt.pool.ntp.org/ntp.aliyun.com/" package/base-files/files/bin/config_generate
sed -i "s/1.openwrt.pool.ntp.org/ntp1.aliyun.com/" package/base-files/files/bin/config_generate
sed -i "s/2.openwrt.pool.ntp.org/ntp2.aliyun.com/" package/base-files/files/bin/config_generate
sed -i "s/3.openwrt.pool.ntp.org/ntp3.aliyun.com/" package/base-files/files/bin/config_generate

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
echo 'src-git NueXini_Packages https://github.com/NueXini/NueXini_Packages.git' >>feeds.conf.default
