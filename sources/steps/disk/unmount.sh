test -e "$LFS_BOOT_PATH" && sudo umount $LFS_BOOT_PATH;
test -e "$LFS_PATH" && sudo umount $LFS_PATH;

test -n "$LINUX_LOOP" && sudo kpartx -dv /dev/$LINUX_LOOP;

exit 0;