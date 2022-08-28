#!/usr/bin/env bash

DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

echo 'Downloading latest prebuilt Camera.apk from GrapheneOS...'
camera_dir=/tmp/GrapheneOSCamera
camera_branch=12.1
rm -rf $camera_dir &&
git clone --depth=1 https://github.com/GrapheneOS/platform_external_Camera.git -b $camera_branch $camera_dir &&
mv $camera_dir/prebuilt/Camera.apk "$DIR"/GrapheneCamera/ || exit $?
echo 'Cloning Kernel tree..'
git clone https://github.com/alone0316/kernel_mido kernel/xiaomi/mido
echo 'Cloning Vendor tree..'
git clone https://github.com/NRanjan-17/vendor_xiaomi_mido vendor/xiaomi/mido
