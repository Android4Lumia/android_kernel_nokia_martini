set -e
export PATH="$PATH:/home/zh/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf/bin"
make clean&&make mrproper&&rm -rf out
mkdir out
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make msm8974_defconfig O=out
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make -j16 O=out CONFIG_NO_ERROR_ON_MISMATCH=y CONFIG_SECTION_MISMATCH_WARN_ONLY=y
sync
cat ./out/arch/arm/boot/zImage ./out/arch/arm/boot/msm8974-martini.dtb > ./out/arch/arm/boot/zImage-dtb
echo "编译完成"
