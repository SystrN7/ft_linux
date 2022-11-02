# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    configure-system.sh                                :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/02 14:33:31 by felix             #+#    #+#              #
#    Updated: 2022/11/02 14:44:27 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Make build multi-threaded
export MAKEFLAGS='-j '$(nproc --all)

# Debug
# whoami
# ls
# env

# Remove some useless libs (debug and other)
source /script/remove-libs.sh
