# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    final.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/03 12:04:57 by felix             #+#    #+#              #
#    Updated: 2022/11/03 16:20:36 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Make multi-hreaded build
export MAKEFLAGS='-j '$(nproc --all)

# Build & Install linux kernel
source /script/build-linux.sh

# Install Grub (boot loader)
source /script/build-grub.sh