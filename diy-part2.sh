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

# https://github.com/sikucankao/Cloud-N1-OpenWrt/blob/main/script.sh
# Add dependencies
cat >> .config <<EOF
CONFIG_PACKAGE_perl=y
CONFIG_PACKAGE_perl-http-date=y
CONFIG_PACKAGE_perl-xml-parser=y
CONFIG_PACKAGE_perlbase-autosplit=y
CONFIG_PACKAGE_perlbase-b=y
CONFIG_PACKAGE_perlbase-base=y
CONFIG_PACKAGE_perlbase-bigint=y
CONFIG_PACKAGE_perlbase-bignum=y
CONFIG_PACKAGE_perlbase-bytes=y
CONFIG_PACKAGE_perlbase-charnames=y
CONFIG_PACKAGE_perlbase-class=y
CONFIG_PACKAGE_perlbase-compress=y
CONFIG_PACKAGE_perlbase-config=y
CONFIG_PACKAGE_perlbase-cwd=y
CONFIG_PACKAGE_perlbase-dirhandle=y
CONFIG_PACKAGE_perlbase-dynaloader=y
CONFIG_PACKAGE_perlbase-encode=y
CONFIG_PACKAGE_perlbase-encoding=y
CONFIG_PACKAGE_perlbase-env=y
CONFIG_PACKAGE_perlbase-errno=y
CONFIG_PACKAGE_perlbase-essential=y
CONFIG_PACKAGE_perlbase-extutils=y
CONFIG_PACKAGE_perlbase-fcntl=y
CONFIG_PACKAGE_perlbase-feature=y
CONFIG_PACKAGE_perlbase-file=y
CONFIG_PACKAGE_perlbase-filehandle=y
CONFIG_PACKAGE_perlbase-getopt=y
CONFIG_PACKAGE_perlbase-i18n=y
CONFIG_PACKAGE_perlbase-integer=y
CONFIG_PACKAGE_perlbase-io=y
CONFIG_PACKAGE_perlbase-ipc=y
CONFIG_PACKAGE_perlbase-json-pp=y
CONFIG_PACKAGE_perlbase-list=y
CONFIG_PACKAGE_perlbase-locale=y
CONFIG_PACKAGE_perlbase-math=y
CONFIG_PACKAGE_perlbase-mime=y
CONFIG_PACKAGE_perlbase-ostype=y
CONFIG_PACKAGE_perlbase-params=y
CONFIG_PACKAGE_perlbase-posix=y
CONFIG_PACKAGE_perlbase-re=y
CONFIG_PACKAGE_perlbase-scalar=y
CONFIG_PACKAGE_perlbase-selectsaver=y
CONFIG_PACKAGE_perlbase-selfloader=y
CONFIG_PACKAGE_perlbase-socket=y
CONFIG_PACKAGE_perlbase-symbol=y
CONFIG_PACKAGE_perlbase-text=y
CONFIG_PACKAGE_perlbase-thread=y
CONFIG_PACKAGE_perlbase-threads=y
CONFIG_PACKAGE_perlbase-tie=y
CONFIG_PACKAGE_perlbase-time=y
CONFIG_PACKAGE_perlbase-unicode=y
CONFIG_PACKAGE_perlbase-unicore=y
CONFIG_PACKAGE_perlbase-utf8=y
CONFIG_PACKAGE_perlbase-xsloader=y
CONFIG_PERL_NOCOMMENT=y
CONFIG_PERL_THREADS=y
CONFIG_PACKAGE_python=y
CONFIG_PACKAGE_python-base=y
CONFIG_PACKAGE_python-codecs=y
CONFIG_PACKAGE_python-compiler=y
CONFIG_PACKAGE_python-ctypes=y
CONFIG_PACKAGE_python-db=y
CONFIG_PACKAGE_python-decimal=y
CONFIG_PACKAGE_python-distutils=y
CONFIG_PACKAGE_python-email=y
CONFIG_PACKAGE_python-gdbm=y
CONFIG_PACKAGE_python-light=y
CONFIG_PACKAGE_python-logging=y
CONFIG_PACKAGE_python-multiprocessing=y
CONFIG_PACKAGE_python-ncurses=y
CONFIG_PACKAGE_python-openssl=y
CONFIG_PACKAGE_python-pip-conf=y
CONFIG_PACKAGE_python-pydoc=y
CONFIG_PACKAGE_python-sqlite3=y
CONFIG_PACKAGE_python-unittest=y
CONFIG_PACKAGE_python-xml=y
CONFIG_PACKAGE_python3=y
CONFIG_PACKAGE_python3-asyncio=y
CONFIG_PACKAGE_python3-base=y
CONFIG_PACKAGE_python3-cgi=y
CONFIG_PACKAGE_python3-cgitb=y
CONFIG_PACKAGE_python3-codecs=y
CONFIG_PACKAGE_python3-ctypes=y
CONFIG_PACKAGE_python3-dateutil=y
CONFIG_PACKAGE_python3-dbm=y
CONFIG_PACKAGE_python3-decimal=y
CONFIG_PACKAGE_python3-distutils=y
CONFIG_PACKAGE_python3-email=y
CONFIG_PACKAGE_python3-gdbm=y
CONFIG_PACKAGE_python3-light=y
CONFIG_PACKAGE_python3-logging=y
CONFIG_PACKAGE_python3-lzma=y
CONFIG_PACKAGE_python3-multiprocessing=y
CONFIG_PACKAGE_python3-ncurses=y
CONFIG_PACKAGE_python3-openssl=y
CONFIG_PACKAGE_python3-pip=y
CONFIG_PACKAGE_python3-pydoc=y
CONFIG_PACKAGE_python3-setuptools=y
CONFIG_PACKAGE_python3-six=y
CONFIG_PACKAGE_python3-sqlite3=y
CONFIG_PACKAGE_python3-unittest=y
CONFIG_PACKAGE_python3-urllib=y
CONFIG_PACKAGE_python3-xml=y
CONFIG_PACKAGE_python3-yaml=y
CONFIG_PACKAGE_fdisk=y
CONFIG_PACKAGE_libfdisk=y
CONFIG_PACKAGE_blkid=y
CONFIG_PACKAGE_libblkid=y
CONFIG_PACKAGE_lsblk=y
CONFIG_PACKAGE_losetup=y
CONFIG_PACKAGE_uuidgen=y
CONFIG_PACKAGE_TAR_BZIP2=y
CONFIG_PACKAGE_TAR_GZIP=y
CONFIG_PACKAGE_TAR_POSIX_ACL=y
CONFIG_PACKAGE_TAR_XATTR=y
CONFIG_PACKAGE_TAR_XZ=y
CONFIG_PACKAGE_tar=y
CONFIG_TARGET_OPTIMIZATION="-Os -pipe -mcpu=generic -march=armv8-a -mtune=cortex-a53"
CONFIG_TARGET_OPTIONS=y
CONFIG_PACKAGE_gawk=y
CONFIG_PACKAGE_getopt=y
CONFIG_PACKAGE_NTFS-3G_USE_LIBFUSE=y
CONFIG_PACKAGE_acl=y
CONFIG_PACKAGE_attr=y
CONFIG_PACKAGE_badblocks=y
CONFIG_PACKAGE_btrfs-progs=y
CONFIG_PACKAGE_chattr=y
CONFIG_PACKAGE_dosfstools=y
CONFIG_PACKAGE_dumpe2fs=y
CONFIG_PACKAGE_e2freefrag=y
CONFIG_PACKAGE_f2fs-tools=y
CONFIG_PACKAGE_f2fsck=y
CONFIG_PACKAGE_fuse-utils=y
CONFIG_PACKAGE_libacl=y
CONFIG_PACKAGE_libattr=y
CONFIG_PACKAGE_libfuse=y
CONFIG_PACKAGE_liblz4=y
CONFIG_PACKAGE_liblzma=y
CONFIG_PACKAGE_liblzo=y
CONFIG_PACKAGE_libtirpc=y
CONFIG_PACKAGE_libwrap=y
CONFIG_PACKAGE_lsattr=y
CONFIG_PACKAGE_mkhfs=y
CONFIG_PACKAGE_nfs-utils=y
CONFIG_PACKAGE_nfs-utils-libs=y
CONFIG_PACKAGE_resize2fs=y
CONFIG_PACKAGE_squashfs-tools-mksquashfs=y
CONFIG_PACKAGE_squashfs-tools-unsquashfs=y
CONFIG_PACKAGE_swap-utils=y
CONFIG_PACKAGE_tune2fs=y
CONFIG_PACKAGE_xfs-admin=y
CONFIG_PACKAGE_xfs-fsck=y
CONFIG_PACKAGE_xfs-growfs=y
CONFIG_PACKAGE_xfs-mkfs=y
CONFIG_SQUASHFS_TOOLS_LZ4_SUPPORT=y
CONFIG_SQUASHFS_TOOLS_LZO_SUPPORT=y
CONFIG_SQUASHFS_TOOLS_XZ_SUPPORT=y
CONFIG_PACKAGE_lscpu=y
CONFIG_DEFAULT_TARGET_OPTIMIZATION="-Os -pipe -mcpu=generic"
CONFIG_CPU_TYPE="generic"
EOF


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


# Add OpenClash
# git clone --depth=1 -b master https://github.com/vernesong/OpenClash

#  OpenClash
echo 'CONFIG_PACKAGE_luci-app-openclash=y' >> .config
echo 'CONFIG_PACKAGE_luci-i18n-openclash-zh-cn=y' >> .config

# Add luci-app-openclash
git clone https://github.com/vernesong/OpenClash.git package-temp
mv -f package-temp/luci-app-openclash package/lean/
cat >> .config <<EOF
CONFIG_LIBCURL_COOKIES=y
CONFIG_LIBCURL_FILE=y
CONFIG_LIBCURL_FTP=y
CONFIG_LIBCURL_HTTP=y
CONFIG_LIBCURL_MBEDTLS=y
CONFIG_LIBCURL_NO_SMB="!"
CONFIG_LIBCURL_PROXY=y
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_ca-bundle=y
CONFIG_PACKAGE_coreutils=y
CONFIG_PACKAGE_coreutils-nohup=y
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_iptables-mod-tproxy=y
CONFIG_PACKAGE_kmod-ip6tables=y
CONFIG_PACKAGE_kmod-ipt-tproxy=y
CONFIG_PACKAGE_kmod-nf-ipt6=y
CONFIG_PACKAGE_kmod-nf-reject6=y
CONFIG_PACKAGE_libcurl=y
CONFIG_PACKAGE_libmbedtls=y
CONFIG_PACKAGE_libncurses=y
CONFIG_PACKAGE_libreadline=y
CONFIG_PACKAGE_luci-app-openclash=y
CONFIG_PACKAGE_terminfo=y
EOF
rm -rf package-temp

#openclash coe
curl -sL -m 30 --retry 2 https://github.com/vernesong/OpenClash/releases/download/Clash/clash-"$CPU_MODEL".tar.gz -o /tmp/clash.tar.gz
tar zxvf /tmp/clash.tar.gz -C /tmp >/dev/null 2>&1
chmod +x /tmp/clash >/dev/null 2>&1
mkdir -p .../package/lean/luci-app-openclash/files/etc/openclash/core
mv /tmp/clash .../package/lean/luci-app-openclash/files/etc/openclash/core/clash >/dev/null 2>&1
rm -rf /tmp/clash.tar.gz >/dev/null 2>&1

#  adguardhome
echo 'CONFIG_PACKAGE_luci-app-adguardhome=y' >> .config
#  smartdns
echo 'CONFIG_PACKAGE_luci-app-smartdns=y' >> .config

#  luci-app-clash
echo 'CONFIG_PACKAGE_luci-app-clash=y' >> .config

#CONFIG_PACKAGE_luci-app-acme=y
echo 'CONFIG_PACKAGE_luci-app-acme=y' >> .config

# Add luci-app-vssr
git clone https://github.com/jerrykuku/lua-maxminddb.git package-temp/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git package-temp/luci-app-vssr
mv -f package-temp/lua-maxminddb package/lean/
mv -f package-temp/luci-app-vssr package/lean/
cat >> .config <<EOF
CONFIG_PACKAGE_lua-maxminddb=y
CONFIG_PACKAGE_luci-app-vssr=y
EOF
rm -rf package-temp


# IPv6支持:
cat >> .config <<EOF
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
EOF

#更新feeds
./scripts/feeds update -a
./scripts/feeds install -a
