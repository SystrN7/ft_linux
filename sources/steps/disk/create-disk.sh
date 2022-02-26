# Create virtual hard drive
sudo dd iflag=nocache oflag=nocache if=/dev/zero of=$LFS_VIRTUAL_DRIVE_FILE bs=1M count=15000