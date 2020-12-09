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


# Modify default IP
sed -i 's/192.168.1.1/192.168.50.111/g' package/base-files/files/bin/config_generate

#cd openwrt
rm -Rf package/lean/luci-theme-argon

#自定插件
#主题
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom
git clone https://github.com/jerrykuku/luci-theme-argon -b 18.06 package/luci-theme-argon
#git clone https://github.com/Leo-Jo-My/luci-theme-argon-light-mod package/luci-theme-argon-light-mod
#git clone https://github.com/Leo-Jo-My/luci-theme-Butterfly-dark  package/luci-theme-Butterfly-dark
git clone https://github.com/Leo-Jo-My/luci-theme-argon-dark-mod package/luci-theme-argon-dark-mod
git clone https://github.com/openwrt-develop/luci-theme-atmaterial package/luci-theme-atmaterial
git clone https://github.com/apollo-ng/luci-theme-darkmatter.git package/luci-theme-darkmatter
git clone https://github.com/rosywrt/luci-theme-rosy.git ./package/luci-theme-rosy

git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome
git clone https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan
git clone https://github.com/pymumu/luci-app-smartdns.git -d lede package/luci-app-smartdns
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
git clone https://github.com/fw876/helloworld.git package/luci-app-ssr-plus
#    https://github.com/sikucankao/DIY-Actions-OpenWrt-Nginx/blob/master/diy.sh
# svn co https://github.com/openwrt/luci/trunk/applications/luci-app-acme
# svn co https://github.com/vernesong/OpenClash/branches/master/luci-app-openclash
git clone https://github.com/frainzy1477/luci-app-clash package/luci-app-clash

# Add OpenClash
git clone --depth=1 -b master https://github.com/vernesong/OpenClash

#  OpenClash
echo 'CONFIG_PACKAGE_luci-app-openclash=y' >> .config
echo 'CONFIG_PACKAGE_luci-i18n-openclash-zh-cn=y'  >> .config
#  adguardhome
echo 'CONFIG_PACKAGE_luci-app-adguardhome=y' >> .config
#  smartdns
echo 'CONFIG_PACKAGE_luci-app-smartdns=y' >> .config

#  luci-app-clash
echo 'CONFIG_PACKAGE_luci-app-clash=y' >> .config

#CONFIG_PACKAGE_luci-app-acme=y
echo 'CONFIG_PACKAGE_luci-app-acme=y' >> .config



#更新feeds
./scripts/feeds update -a
./scripts/feeds install -a
