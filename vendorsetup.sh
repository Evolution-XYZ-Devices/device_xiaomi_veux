echo 'Starting to clone stuffs needed for your device'
# Stuffs to rm -rf
rm -rf hardware/qcom-caf/sm8350/display

echo 'Cloning Hals [1/4]'
# Hals
git clone https://github.com/JaswalAshish/hardware_qcom-caf_sm8350_display.git hardware/qcom-caf/sm8350/display

echo 'Cloning Vendor tree [2/4]'
# Vendor Tree
git clone https://gitlab.com/JaswalAshish/vendor_xiaomi_veux.git vendor/xiaomi/veux

echo 'Cloning Kernel tree [3/4]'
# Kernel Tree
git clone --depth=1 https://github.com/JaswalAshish/kernel_xiaomi_sm8350.git kernel/xiaomi/sm6375

echo 'Cloning Prebuilt Kernel tree [4/4]'
# Prebuilt Kernel Tree
git clone https://github.com/JaswalAshish/device_xiaomi_veux-kernel.git device/xiaomi/veux-kernel

echo 'Completed, proceeding to lunch'
