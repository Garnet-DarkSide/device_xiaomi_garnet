echo 'Starting to clone stuffs needed to build for garnet'

# Vendor
echo 'Cloning Vendor'
git clone https://github.com/Garnet-DarkSide/vendor_xiaomi_garnet.git -b alpha-15.2 vendor/xiaomi/garnet

# Kernel
echo 'Cloning Kernel'
git clone https://github.com/Garnet-DarkSide/device_xiaomi_garnet-prebuilt.git -b kyoka-ksu device/xiaomi/garnet-prebuilt

# Hardware
echo 'Cloning Hardware'
git clone https://github.com/Garnet-DarkSide/hardware_xiaomi.git -b 15 hardware/xiaomi

# Dolby
echo 'Cloning Dolby'
git clone https://github.com/Garnet-DarkSide/hardware_dolby.git -b 15 hardware/dolby

# Miuicamera
echo 'Cloning Camera Device'
git clone https://github.com/Garnet-DarkSide/device_xiaomi_miuicamera-garnet.git -b 15.2 device/xiaomi/miuicamera-garnet

# Camera
echo 'Cloning Camera Vendor'
git clone https://codeberg.org/JYRRC/vendor_xiaomi_miuicamera-garnet.git -b 15 vendor/xiaomi/miuicamera-garnet

# Basic Call Recorder (bcr)
echo 'Cloning Bcr'
git clone https://github.com/Garnet-DarkSide/vendor_bcr.git vendor/bcr

# Audio
rm -rf hardware/qcom-caf/sm8450/audio/graphservices/*

cd hardware/qcom-caf/sm8450/audio/agm
git checkout 62ac0643c907e9566ed99929d947127d8e3b123e
cd ../pal
git checkout 4dfc6be2ac56b7d4aa5b2d919823e612ce1c711b
git revert f3af214667071cd42394f05708633b0ae75eb819
cd ../../../../..
