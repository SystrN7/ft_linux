# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    build-system.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/18 10:34:18 by felix             #+#    #+#              #
#    Updated: 2022/10/25 11:51:15 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Debug
# whoami
# ls

export MAKEFLAGS='-j '$(nproc --all)

mkdir -vp /build

# Install Linux headers
# source /script/build/linux-headers.sh

# Install Man
# source /script/build/man.sh

# Build & install Glibc
# source /script/build/glibc.sh

# Ajust toolchain
source /script/build/change-toolchain.sh