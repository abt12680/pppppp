#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# Modify default IP
sed -i 's/192.168.1.1/192.168.50.111/g' package/base-files/files/bin/config_generate

cd openwrt
rm -Rf package/lean/luci-theme-argon

#自定插件
git clone https://github.com/jerrykuku/luci-theme-argon -b 19.07_stable package/luci-theme-argon
git clone https://github.com/openwrt-develop/luci-theme-atmaterial package/luci-theme-atmaterial
git clone https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan
git clone https://github.com/apollo-ng/luci-theme-darkmatter.git package/luci-theme-darkmatter
git clone https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
git clone https://github.com/fw876/helloworld.git package/luci-app-ssr-plus
git clone https://github.com/rosywrt/luci-theme-rosy.git ./package/luci-theme-rosy

#更新feeds
./scripts/feeds update -a
./scripts/feeds install -a
