#!/bin/bash

source /etc/os-release

version_codename=$(echo $VERSION_CODENAME)

if [[ $version_codename == "bookworm" ]]; then
    dtc -W no-unit_address_vs_reg -@ -I dts -O dtb -o imx477.dtbo ./bookworm/imx477-overlay.dts 
    
    sudo cp /boot/firmware/overlays/imx477.dtbo /boot/firmware/overlays/imx477.dtbo.bak
    sudo cp imx477.dtbo /boot/firmware/overlays/imx477.dtbo
else
    dtc -@ -I dts -O dtb -o imx477.dtbo ./bullseye/imx477-overlay.dts 

    sudo cp /boot/overlays/imx477.dtbo /boot/overlays/imx477.dtbo.bak
    sudo cp imx477.dtbo /boot/overlays/imx477.dtbo
fi