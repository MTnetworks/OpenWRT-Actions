#!/bin/bash
#=================================================
# Lisence: MIT
# Author: MTnetwork
# Blog: https://www.mtwl.net
#=================================================
# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default

# Modify default IP
#修改默认 IP为192.168.1.1
sed -i 's/192.168.1.1/10.10.10.1/g' package/base-files/files/bin/config_generate
# 修改机器名称
sed -i 's/OpenWrt/MTnetwork/g' package/base-files/files/bin/config_generate
# 编辑默认的luci显示的固件名称
sed -i 's/OpenWrt/MTopenwrt/g' package/base-files/files/bin/config_generate
#删除原主题	
rm -rf package/lean/luci-theme-netgear
#添加新的主题和插件
git clone https://github.com/sypopo/luci-theme-atmaterial.git package/lean/luci-theme-atmaterial
git clone https://github.com/vernesong/OpenClash.git package/lean/luci-app-OpenClash
# '修改默认主题'
# sed -i 's/config internal themes/config internal themes\n    option Argon  \"\/luci-static\/argon\"/g' feeds/luci/modules/luci-base/root/etc/config/luci
#取消bootstrap为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
#删除默认密码
sed -i "/CYXluq4wUazHjmCDBCqXF/d" package/lean/default-settings/files/zzz-default-settings
# 修改wifi名称
sed -i 's/OpenWrt/MTnetwork/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#修改banner
rm -rf package/base-files/files/etc/banner
cp -f ../banner package/base-files/files/etc/

# npm-cache
npm config set cache ~/.npm-cache --global

# 添加额外的软件包，echo 方式和git clone 方式二选一即可
#echo 'src-git kenzok8 https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default
#git clone https://github.com/kenzok8/openwrt-packages.git package/openwrt-packages
#git clone https://github.com/kenzok8/small.git package/small
git clone https://github.com/stevenjoezhang/luci-app-adguardhome.git package/ADGH
