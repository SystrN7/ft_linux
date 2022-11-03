export $(grep -v '^#' config.env | xargs -d '\n')
set e

cp --remove-destination ./sources/steps/prepare-system.sh $LFS_PATH/script/prepare-system.sh
cp --remove-destination ./sources/steps/build-system.sh $LFS_PATH/script/build-system.sh
cp --remove-destination ./sources/steps/configure-system.sh $LFS_PATH/script/configure-system.sh
cp --remove-destination ./sources/steps/final.sh $LFS_PATH/script/final.sh
cp -r --remove-destination ./sources/steps/final-system/ $LFS_PATH/script/
cp -r --remove-destination ./sources/steps/build/system/* $LFS_PATH/script/build
cp -r --remove-destination ./sources/steps/configure-system/* $LFS_PATH/script/
cp -r --remove-destination ./sources/steps/final/. $LFS_PATH/script/

# Mounting boot into the lfs folder
# sudo mount --bind $LFS_BOOT_PATH $LFS_PATH/boot

# Mounting the lfs img as root of file system to build & install linux and grub
sudo chroot $(pwd)"/$LFS_PATH" /usr/bin/env -i \
    HOME=/root TERM="$TERM"            \
    PS1='(lfs chroot) \u:\w\$ '        \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    /bin/bash --login -e +h /script/final.sh

exit 1

# Configure the system
sudo chroot $(pwd)"/$LFS_PATH" /usr/bin/env -i \
    HOME=/root TERM="$TERM"            \
    PS1='(lfs chroot) \u:\w\$ '        \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    /bin/bash --login -e +h /script/configure-system.sh

exit 1

# Mounting the lfs img as root of file system to prepare file system
sudo chroot $(pwd)"/$LFS_PATH" /tools/bin/env -i \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
    /tools/bin/bash --login -e +h /script/prepare-system.sh

# /tools/bin/bash --login +he $(pwd)"/$LFS_PATH/script/prepare-system.sh"


    sudo chroot $(pwd)"/$LFS_PATH" /tools/bin/env -i \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
    /tools/bin/bash --login -e +h /script/build-system.sh