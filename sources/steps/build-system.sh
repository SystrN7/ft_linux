# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    build-system.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/18 10:34:18 by felix             #+#    #+#              #
#    Updated: 2022/10/25 15:46:01 by felix            ###   ########lyon.fr    #
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
# source /script/build/change-toolchain.sh

# Build & Install Zlib
# source /script/build/zlib.sh

# Build & Install File
# source /script/build/file.sh

# Build & Install Readline
# source /script/build/readline.sh

# Build & Install M4
source /script/build/m4.sh