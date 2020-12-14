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
# 参考 https://github.com/huangqian8/Cloud-N1-OpenWrt


# Modify default IP
sed -i 's/192.168.1.1/192.168.50.111/g' package/base-files/files/bin/config_generate

#cd openwrt
rm -Rf package/lean/luci-theme-argon

# https://github.com/sikucankao/Cloud-N1-OpenWrt/blob/main/script.sh


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
#git clone https://github.com/pymumu/luci-app-smartdns.git -d lede package/luci-app-smartdns
#git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
#git clone https://github.com/fw876/helloworld.git package/luci-app-ssr-plus
#    https://github.com/sikucankao/DIY-Actions-OpenWrt-Nginx/blob/master/diy.sh
svn co https://github.com/openwrt/luci/tree/master/applications/luci-app-acme
# svn co https://github.com/vernesong/OpenClash/branches/master/luci-app-openclash
git clone https://github.com/frainzy1477/luci-app-clash package/luci-app-clash

# themes
cat >> .config <<EOF
CONFIG_PACKAGE_luci-theme-darkmatter=y
CONFIG_PACKAGE_luci-theme-rosy=y	
CONFIG_PACKAGE_luci-theme-atmaterial=y
CONFIG_PACKAGE_luci-theme-argon-dark-mod=y	
#CONFIG_PACKAGE_luci-theme-argon-light-mod=y	
CONFIG_PACKAGE_luci-theme-bootstrap=y	
CONFIG_PACKAGE_luci-theme-bootstrap-mod=y	
#CONFIG_PACKAGE_luci-theme-Butterfly-dark	
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-theme-bootstrap=y
CONFIG_PACKAGE_luci-theme-freifunk-generic=y
CONFIG_PACKAGE_luci-theme-material=y
CONFIG_PACKAGE_luci-theme-netgear=y
EOF

# Add luci-theme-opentomcat
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git theme-temp/luci-theme-opentomcat
rm -rf theme-temp/luci-theme-opentomcat/LICENSE
rm -rf theme-temp/luci-theme-opentomcat/README.md
mv -f theme-temp/luci-theme-opentomcat package/lean/
cat >> .config <<EOF
CONFIG_PACKAGE_luci-theme-opentomcat=y
EOF
rm -rf theme-temp
default_theme='opentomcat'
sed -i "s/bootstrap/$default_theme/g" feeds/luci/modules/luci-base/root/etc/config/luci

#  OpenClash
echo 'CONFIG_PACKAGE_luci-app-openclash=y' >> .config
#echo 'CONFIG_PACKAGE_luci-i18n-openclash-zh-cn=y' >> .config

# Add luci-app-openclash
git clone https://github.com/vernesong/OpenClash.git package-temp
mv -f package-temp/luci-app-openclash package/lean/
cat >> .config <<EOF
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_coreutils=y
CONFIG_PACKAGE_coreutils-nohup=y
CONFIG_PACKAGE_jsonfilter=y
CONFIG_DEFAULT_ca-certificates=y	
CONFIG_PACKAGE_dnsmasq_full_ipset=y	
CONFIG_PACKAGE_dnsmasq-full=y	
CONFIG_PACKAGE_iptables-mod-tproxy=y	
CONFIG_PACKAGE_ip-full=y	
CONFIG_PACKAGE_ipset=y	
CONFIG_PACKAGE_iptables-mod-tproxy=y	
CONFIG_PACKAGE_iptables-mod-extra=y	
CONFIG_PACKAGE_libcap=y	
CONFIG_PACKAGE_libcap-bin=y	
CONFIG_PACKAGE_ruby=y	
CONFIG_PACKAGE_ruby-yaml=y	
CONFIG_PACKAGE_ip6tables-mod-nat=y
CONFIG_PACKAGE_iptables=y
EOF
rm -rf package-temp

#openclash coe
#curl -sL -m 30 --retry 2 https://github.com/vernesong/OpenClash/releases/download/Clash/clash-"$CPU_MODEL".tar.gz -o /tmp/clash.tar.gz
#tar zxvf /tmp/clash.tar.gz -C /tmp >/dev/null 2>&1
#chmod +x /tmp/clash >/dev/null 2>&1
#mkdir -p .../package/lean/luci-app-openclash/files/etc/openclash/core
#mv /tmp/clash .../package/lean/luci-app-openclash/files/etc/openclash/core/clash >/dev/null 2>&1
#rm -rf /tmp/clash.tar.gz >/dev/null 2>&1

#  adguardhome
echo 'CONFIG_PACKAGE_luci-app-adguardhome=y' >> .config
#  smartdns
#echo 'CONFIG_PACKAGE_luci-app-smartdns=y' >> .config

#  luci-app-clash
echo 'CONFIG_PACKAGE_luci-app-clash=y' >> .config

#CONFIG_PACKAGE_luci-app-acme=y
echo 'CONFIG_PACKAGE_luci-app-acme=y' >> .config

# Add luci-app-vssr
#git clone https://github.com/jerrykuku/lua-maxminddb.git package-temp/lua-maxminddb
#git clone https://github.com/jerrykuku/luci-app-vssr.git package-temp/luci-app-vssr
#mv -f package-temp/lua-maxminddb package/lean/
#mv -f package-temp/luci-app-vssr package/lean/
#cat >> .config <<EOF
#CONFIG_PACKAGE_lua-maxminddb=y
#CONFIG_PACKAGE_luci-app-vssr=y
#EOF
#rm -rf package-temp


# IPv6支持:
cat >> .config <<EOF
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
EOF

#更新feeds
./scripts/feeds update -a
./scripts/feeds install -a
