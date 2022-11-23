# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    build-extra.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/23 15:59:39 by felix             #+#    #+#              #
#    Updated: 2022/11/23 23:40:07 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Debug
# whoami
# ls

export MAKEFLAGS='-j '$(nproc --all)

mkdir -vp /build

# Build & Install CURL
source /script/build/curl.sh

# Build & Install GDB
source /script/build/gdb.sh

# Build & Install Openssh
source /script/build/openssh.sh

# Build & Install Git
source /script/build/git.sh

# Build & Install DHCP (Client)

# Remove build directory
rm -rf /build
