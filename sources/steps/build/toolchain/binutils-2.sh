# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    binutils-2.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/03 18:14:57 by felix             #+#    #+#              #
#    Updated: 2022/09/29 15:14:13 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy binutils sources.
cp -r --preserve build/lfs/sources/binutils-2.32 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/binutils-2.32

# Create build directory
mkdir build
cd build

# Create makefile with config
CC=$LFS_TGT-gcc                \
AR=$LFS_TGT-ar                 \
RANLIB=$LFS_TGT-ranlib         \
../configure                   \
    --prefix=/tools            \
    --disable-nls              \
    --disable-werror           \
    --with-lib-path=/tools/lib \
    --with-sysroot

# Build
make 

# Install
make install

# ?
make -C ld clean
make -C ld LIB_PATH=/usr/lib:/lib
cp -v ld/ld-new /tools/bin

popd

# Remove temps build dir
rm -rf $LFS_TOOLS_PATH/build/binutils-2.32