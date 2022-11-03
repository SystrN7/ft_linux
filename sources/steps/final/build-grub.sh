# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    build-grub.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/03 15:01:58 by felix             #+#    #+#              #
#    Updated: 2022/11/03 16:19:24 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Make image Bootable
grub-install --force --target i386-pc /dev/$LINUX_LOOP

# Create grub config
cat > /boot/grub/grub.cfg << "EOF"
# Début de /boot/grub/grub.cfg
set default=0
set timeout=5

insmod fat
set root=(hd0,1)

menuentry "GNU/Linux, Linux 4.20.12-lfs-8.4" {
        linux   /vmlinuz-4.20.12-lfs-8.4 root=/dev/sda3 ro
}
EOF