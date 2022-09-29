# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    expect.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/29 19:09:57 by felix             #+#    #+#              #
#    Updated: 2022/09/29 19:23:10 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/expect5.45.4 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/expect5.45.4

# Configure the system
cp -v configure{,.orig}
sed 's:/usr/local/bin:/bin:' configure.orig > configure

# Create makefile with config
./configure --prefix=/tools       \
            --with-tcl=/tools/lib \
            --with-tclinclude=/tools/include

# Build
make 

# Install
make SCRIPTS="" install

popd

# Remove temps build dir
rm -rf $LFS_TOOLS_PATH/build/expect5.45.4