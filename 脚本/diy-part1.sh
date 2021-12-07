#！/bin/bash
#
#版权所有 (c) 2019-2020 P3TERX <https://p3terx.com>
#
#这是免费软件，在 MIT 许可下获得许可。
#有关详细信息，请参阅 /LICENSE。
#
# https://github.com/P3TERX/Actions-OpenWrt
#文件名：diy-part1.sh
#描述：OpenWrt DIY 脚本第 1 部分（更新提要之前）
#
#取消对提要来源的注释
sed -i ' s/^#\(.*helloworld\)/\1/ ' feeds.conf.default
#添加订阅源
sed -i ' $a src-git lienol https://github.com/Lienol/openwrt-package ' feeds.conf.default
sed -i ' $a src-git diy https://github.com/CCnut/feed-netkeeper.git;LUCI-LUA-UCITRACK ' feeds.conf.default
#添加 luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
rm -rf ../lean/luci-theme-argon
# Svn 从 immortalwrt 的存储库中检出包
git clone --depth=1 https://github.com/immortalwrt/packages -b openwrt-18.06 包
git clone --depth=1 https://github.com/immortalwrt/luci -b openwrt-18.06 luci
