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

# Rollback compilation, eg:git checkout <commit_id> 
# Before Openssl bump 3.0.10 fix transmission
#git checkout a2a0e5b

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source （openwrt-packages is release version; small-package is beta version; small is passwall Library dependencies, golang is smpackage compilation tools）
#sed -i '$a src-git kiddin9 https://github.com/kiddin9/openwrt-packages.git' feeds.conf.default
#sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
#sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default
#sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default

#Insert the code into the last line as a component supplement (prioritize using components from the source code)
sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default

# Insert the code into the first line to replace the ‘golang’ component in the source code
sed -i '1i src-git golang https://github.com/kenzok8/golang feeds/packages/lang/golang.git' feeds.conf.default
