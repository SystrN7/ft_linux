# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    unmount.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/13 22:20:17 by felix             #+#    #+#              #
#    Updated: 2022/09/16 19:24:19 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

test -e "$LFS_BOOT_PATH" && sudo umount $LFS_BOOT_PATH;
test -e "$LFS_PATH" && sudo umount $LFS_PATH;

test -n "$LINUX_LOOP" && sudo kpartx -dvs /dev/$LINUX_LOOP;