echo 'Starting to clone stuffs needed for your device'

echo 'Cloning Vendor tree [1/4]'
# Vendor Tree
git clone https://gitlab.com/JaswalAshish/vendor_xiaomi_veux vendor/xiaomi/veux

echo 'Cloning Firmware tree [2/4]'
# Firmware Tree
git clone https://gitlab.com/JaswalAshish/vendor_xiaomi_veux-firmware.git vendor/xiaomi/veux-firmware

echo 'Cloning Kernel tree [3/4]'
# Kernel Tree
git clone --depth=1 https://github.com/crdroidandroid/android_kernel_oneplus_sm8350 kernel/xiaomi/sm6375

echo 'Cloning Prebuilt Kernel tree [4/4]'
# Prebuilt Kernel Tree
git clone https://github.com/JaswalAshish/device_xiaomi_veux-kernel.git device/xiaomi/veux-kernel

echo 'Completed, proceeding to lunch'
