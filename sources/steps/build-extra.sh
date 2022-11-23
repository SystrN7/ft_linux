# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    build-extra.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/23 15:59:39 by felix             #+#    #+#              #
#    Updated: 2022/11/23 19:33:10 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Debug
# whoami
# ls

export MAKEFLAGS='-j '$(nproc --all)

mkdir -vp /build

# Build & Install CURL
source /script/build/curl.sh

# Build & Install Openssh

# Build & Install DHCP (Client)

# Build & Install Git

# Remove build directory
rm -rf /build
