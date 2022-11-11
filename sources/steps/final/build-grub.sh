# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    build-grub.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/03 15:01:58 by felix             #+#    #+#              #
#    Updated: 2022/11/10 21:58:01 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Make image Bootable
grub-install --force --target i386-pc /dev/$LINUX_LOOP

# Create grub config
cat > /boot/grub/grub.cfg << "EOF"
# Début de /boot/grub/grub.cfg
set default=0
set timeout=5

set root=(hd0,1)

EOF

# Add lfs to the GRUB menu
echo "menuentry \"GNU/Linux, Linux 4.20.12-$LFS_KERNEL_BINARY_CODENAME\" {
        linux   /vmlinuz-4.20.12-$LFS_KERNEL_BINARY_CODENAME root=/dev/sda3 ro
}" >> /boot/grub/grub.cfg
