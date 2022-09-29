# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    linux-headers.sh                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/29 10:38:00 by felix             #+#    #+#              #
#    Updated: 2022/09/29 10:44:09 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy linux kernel sources.
cp -r --preserve build/lfs/sources/linux-4.20.12 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/linux-4.20.12

# Clean up the linux sources
make mrproper

# Install and move the linux kernel header to the right directory
make INSTALL_HDR_PATH=dest headers_install
cp -rv dest/include/* /tools/include

popd

rm -rf $LFS_TOOLS_PATH/build/linux-4.20.12
