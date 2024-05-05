# IMX477-Motorized-Focus-Camera

## Doc url: https://docs.arducam.com/Raspberry-Pi-Camera/Motorized-Focus-Camera/Quick-Start-Guide/IMX477-Motorized-Focus-Camera/

## Install (Raspberry Pi OS 64-bit [Bookworm])

- `cd ~/`

- `git clone https://github.com/0x000000000019b6/IMX477-Motorized-Focus-Camera.git`
&nbsp;
- `cd ~/IMX477-Motorized-Focus-Camera/`

### Focus Driver:

- `cd ~/IMX477-Motorized-Focus-Camera/imx477_rpi_dtoverlay`
&nbsp;
- `./build_and_install.sh`

### Configure the Camera:
- `sudo raspi-config nonint do_camera 1`
&nbsp;
- `grep -q 'dtoverlay=imx477,vcm' /boot/firmware/config.txt || echo 'dtoverlay=imx477,vcm' | sudo tee -a /boot/firmware/config.txt > /dev/null`

### Install libcamera from Arducam:
- ###### FIX *couldn't be accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied):*<br/> `echo 'APT::Sandbox::User "root";' | sudo tee /etc/apt/apt.conf.d/10sandbox`
- `cd ~/IMX477-Motorized-Focus-Camera/`

- `./install_pivariety_pkgs.sh -p libcamera`

- `./install_pivariety_pkgs.sh -p libcamera_apps`

## Test camera:
- `libcamera-still -t 1000 --autofocus-on-capture --tuning-file /usr/share/libcamera/ipa/rpi/vc4/imx477_af.json -n -o test.jpg`