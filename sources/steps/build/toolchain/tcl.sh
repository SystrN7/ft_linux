# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    tcl.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/29 18:45:04 by felix             #+#    #+#              #
#    Updated: 2022/09/29 18:55:17 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy GCC sources.
cp -r --preserve build/lfs/sources/tcl8.6.9 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/tcl8.6.9

cd unix

# Create makefile with config
./configure --prefix=/tools

# Build
make

# Install into the tools directory
make install

chmod -v u+w /tools/lib/libtcl8.6.so

make install-private-headers

ln -sv tclsh8.6 /tools/bin/tclsh

popd

rm -rf $LFS_TOOLS_PATH/build/tcl8.6.9
