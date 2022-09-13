# Delete LFS user
sudo deluser --remove-home $LFS_USER

# Delete LFS user group
sudo groupdel $LFS_GROUP

# Delete link
rm $LFS_TOOLS_PATH
