# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    prepare-system.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/18 12:35:44 by felix             #+#    #+#              #
#    Updated: 2022/11/10 21:50:09 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Debug
# env
# pwd
# ls /

# Create base directory
source /script/prepare-system/create-root-directory.sh

# Create link betwen final system and cross toolchain
source /script/prepare-system/create-symbolic-link.sh

# Create user and groups
source /script/prepare-system/create-users-groups.sh

# Create login logs
source /script/prepare-system/create-log.sh
