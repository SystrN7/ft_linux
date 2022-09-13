if id "$LFS_USER" > /dev/null 2>&1; then
    # Delete LFS user
	sudo deluser --remove-home $LFS_USER

	# Delete LFS user group
	sudo groupdel $LFS_GROUP
fi

# Delete link
sudo rm -f /$LFS_TOOLS_DIRECTORY
