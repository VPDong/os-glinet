#!/bin/bash

CRTDIR=$(pwd)

base=$1
echo $base
if [ ! -e "$base" ]; then
	echo "Please enter base folder"
	exit 1
else
	if [ ! -d $base ]; then 
		echo "Openwrt base folder not exist"
		exit 1
	fi
fi

echo "start to build..."

#clone source
git clone https://github.com/gl-inet/gl-infra-builder.git $base/gl-infra-builder
if [ -d $base/gl-infra-builder/feeds/glinet/helloworld ]; then
   rm -rf $base/gl-infra-builder/feeds/glinet/helloworld
fi
hasCustom="false"
if [ -f custom.yml ]; then 
    hasCustom="true"
	cp -r custom.yml $base/gl-infra-builder/profiles
	cp -r custom/  $base/gl-infra-builder/feeds/custom/
fi

#setup source
cd $base/gl-infra-builder
python3 setup.py -c config-wlan-ap.yml
cd wlan-ap/openwrt
if[ "$hasCustom" == "false" ]; then
    /scripts/gen_config.py target_wlan_ap-gl-axt1800 luci
else
    /scripts/gen_config.py target_wlan_ap-gl-axt1800 luci custom
fi
./scripts/feeds update -a 
./scripts/feeds install -a
make defconfig

# build source
make -j$(expr $(nproc) + 1) V=s

echo "success to build..."