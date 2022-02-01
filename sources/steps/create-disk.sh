# Create virtual hard drive
mkdir ./build
sudo dd if=/dev/zero of=$LFS_VIRTUAL_DRIVE_FILE bs=1M count=15000

