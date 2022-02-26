
sudo umount $LFS_BOOT_PATH 
sudo umount $LFS_PATH

sudo kpartx -dv /dev/$LINUX_LOOP