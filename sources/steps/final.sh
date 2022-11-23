# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    final.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/03 12:04:57 by felix             #+#    #+#              #
#    Updated: 2022/11/23 19:11:27 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Make multi-hreaded build
export MAKEFLAGS='-j '$(nproc --all)

# Build & Install linux kernel
source /script/build-linux.sh

# Install Grub (boot loader)
source /script/build-grub.sh

# Clean System
source /script/clean.sh

# Clean everything
rm -rf /script /tools