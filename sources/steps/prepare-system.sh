# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    prepare-system.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/18 12:35:44 by felix             #+#    #+#              #
#    Updated: 2022/10/21 14:58:19 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Debug
# env
# pwd
# ls /

# Create base directory
# source /script/final-system/create_root_directory.sh

# Create link betwen final system and cross toolchain
# source /script/final-system/create_symbolic_link.sh

# Create user and groups
source /script/final-system/create_users_groups.sh
