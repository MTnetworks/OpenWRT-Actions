#!/bin/bash
#=================================================
# Lisence: MIT
# Author: MTnetwork
# Blog: https://www.mtwl.net
#=================================================
# # 添加额外的软件包Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
# echo 'src-git lean_packages https://github.com/coolsnowwolf/packages.git' >>feeds.conf.default
# Modify default IP
#修改默认 IP为192.168.1.1
sed -i 's/192.168.1.1/10.10.10.1/g' package/base-files/files/bin/config_generate
# 修改机器名称
sed -i 's/OpenWrt/MTnetwork/g' package/base-files/files/bin/config_generate
# 编辑默认的luci显示的固件名称
sed -i 's/OpenWrt/MTopenwrt/g' package/base-files/files/bin/config_generate
#添加新的主题和插件
git clone https://github.com/sypopo/luci-theme-atmaterial.git package/luci-theme-atmaterial
# Argon主题配置
# git clone https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
# Argon主题
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
# Edge主题
git clone https://github.com/garypang13/luci-theme-edge.git package/luci-theme-edge
# PassWall2
# git clone https://github.com/xiaorouji/openwrt-passwall2.git package/luci-app-passwall2
# 网速测试
git clone https://github.com/sirpdboy/luci-app-netspeedtest.git package/luci-app-netspeedtest
# istore商店
git clone https://github.com/linkease/istore.git package/istore
# OPAssistant
# git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter    
# 
#openwrt-apps
git clone https://github.com/MTnetworks/openwrt-apps package/openwrt-apps

# 1. 添加 Argon 主题到列表
sed -i 's/config internal themes/config internal themes\n    option Argon  \"\/luci-static\/argon\"/g' feeds/luci/modules/luci-base/root/etc/config/luci
# 2. 设置 Argon 为默认主题
sed -i "s|option mediaurlbase .*|option mediaurlbase '/luci-static/argon'|g" feeds/luci/modules/luci-base/root/etc/config/luci
#删除默认密码
# sed -i "/CYXluq4wUazHjmCDBCqXF/d" package/lean/default-settings/files/zzz-default-settings
# 修改wifi名称
# sed -i 's/OpenWrt/MTnetwork/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#修改banner
rm -rf package/base-files/files/etc/banner
cp -f ../banner package/base-files/files/etc/

