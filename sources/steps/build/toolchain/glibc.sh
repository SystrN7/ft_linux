# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    glibc.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/29 10:38:00 by felix             #+#    #+#              #
#    Updated: 2022/09/29 15:00:51 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy glibc sources.
cp -r --preserve build/lfs/sources/glibc-2.29 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/glibc-2.29

# Create glibc build directory
mkdir -v build
cd       build

# Create makefile with config
../configure                             \
      --prefix=/tools                    \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=3.2                \
      --with-headers=/tools/include

# Build
make

# Install into the tools directory
make install

popd

rm -rf $LFS_TOOLS_PATH/build/glibc-2.29
