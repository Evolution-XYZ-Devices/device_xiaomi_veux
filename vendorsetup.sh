echo 'Starting to clone stuffs needed for your device'

echo 'Cloning Vendor tree [1/3]'
# Vendor Tree
git clone https://gitlab.com/JaswalAshish/vendor_xiaomi_veux vendor/xiaomi/veux

echo 'Cloning Firmware tree [2/3]'
# Firmware Tree
git clone https://gitlab.com/JaswalAshish/vendor_xiaomi_veux-firmware.git vendor/xiaomi/veux-firmware

echo 'Cloning Kernel tree [3/3]'
# Kernel Tree
git clone --depth=1 https://github.com/dereference23/kernel_xiaomi_sm6375 kernel/xiaomi/sm6375

echo 'Completed, proceeding to lunch'
