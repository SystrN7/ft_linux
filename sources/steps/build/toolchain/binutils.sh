# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    binutils.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/03 18:14:57 by felix             #+#    #+#              #
#    Updated: 2022/09/27 14:41:01 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy binutils sources.
cp -r build/lfs/sources/binutils-2.32 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/binutils-2.32

mkdir build
cd build

# Create makefile with config
../configure --prefix=/tools            \
             --with-sysroot=$LFS_PATH       \
             --with-lib-path=/tools/lib \
             --target=$LFS_TGT          \
             --disable-nls              \
             --disable-werror

# Build binutils
make

# For x64 system
case $(uname -m) in
  x86_64) mkdir -v /tools/lib && ln -sv lib /tools/lib64 ;;
esac

make install

popd

# Remove temps build dir
rm -rf $LFS_TOOLS_PATH/build/binutils-2.32