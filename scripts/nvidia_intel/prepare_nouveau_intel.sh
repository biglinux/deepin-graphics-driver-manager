#!/bin/sh

COMMANDS=(
    "apt update"
    "apt install -d xserver-xorg-video-nouveau -y --allow-downgrades"
    "apt install -d xserver-xorg-input-all libgl1-mesa-glx -y --allow-downgrades"
#    "apt install -o Dir::Cache::Archives=/var/cache/nvidia/ -d nvidia-driver"
    "overlayroot-enable"
#    "apt-get install nvidia-driver -y --allow-downgrades"
#    "apt install -d deepin-deb-installer"
)

for cmd in "${COMMANDS[@]}"
do
    command ${cmd};

    if [ $? != 0 ]; then
        echo "### Failed in command '${cmd}'"
        exit -1;
    fi
    [ -f /etc/X11/xorg.conf.d/20-intel.conf ] && rm -rf /etc/X11/xorg.conf.d/20-intel.conf
done
