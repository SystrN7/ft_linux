# Create virtual hard drive
# fallocate -l 15G $LFS_VIRTUAL_DRIVE_FILE # Don't work wiht kpartx
dd if=/dev/zero of=$LFS_VIRTUAL_DRIVE_FILE bs=1M count=15000