export $(grep -v '^#' config.env | xargs -d '\n')
set e

cp --remove-destination ./sources/steps/prepare-system.sh $LFS_PATH/script/prepare-system.sh
cp -r --remove-destination ./sources/steps/final-system/ $LFS_PATH/script/

# Mounting the lfs img as root of file system to prepare file system
sudo chroot $(pwd)"/$LFS_PATH" /tools/bin/env -i \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
    /tools/bin/bash --login +he /script/prepare-system.sh

# /tools/bin/bash --login +he $(pwd)"/$LFS_PATH/script/prepare-system.sh"
    