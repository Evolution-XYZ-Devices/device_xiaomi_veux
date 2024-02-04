echo 'Starting to clone stuffs needed for your device'

echo 'Cloning Vendor tree [1/3]'
# Vendor Tree
git clone https://gitlab.com/JaswalAshish/vendor_xiaomi_veux vendor/xiaomi/veux

echo 'Cloning Kernel tree [2/3]'
# Kernel Tree
git clone --depth=1 https://github.com/dereference23/kernel_xiaomi_sm6375 kernel/xiaomi/sm6375

echo 'Cloning ViPER4AndroidFX [3/3]'
git clone https://github.com/TogoFire/packages_apps_ViPER4AndroidFX packages/apps/ViPER4AndroidFX

echo 'Completed, proceeding to lunch'
