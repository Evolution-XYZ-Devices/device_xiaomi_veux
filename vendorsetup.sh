echo 'Starting to clone stuffs needed for your device'

echo 'Cloning Vendor tree [1/2]'
# Vendor Tree
git clone https://gitlab.com/ThePrateekBhatia/vendor_xiaomi_veux.git vendor/xiaomi/veux

echo 'Cloning Kernel tree [2/2]'
# Kernel Tree
git clone --depth=1 https://github.com/dereference23/kernel_xiaomi_sm6375 kernel/xiaomi/sm6375

echo 'Completed, proceeding to lunch'
