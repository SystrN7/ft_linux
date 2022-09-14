# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    clean-user-env.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/13 22:20:13 by felix             #+#    #+#              #
#    Updated: 2022/09/13 22:20:14 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

if id "$LFS_USER" > /dev/null 2>&1; then
    # Delete LFS user
	sudo deluser --remove-home $LFS_USER

	# Delete LFS user group
	sudo groupdel $LFS_GROUP
fi

# Delete link
sudo rm -f /$LFS_TOOLS_DIRECTORY
