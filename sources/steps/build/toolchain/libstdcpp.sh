# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    libstdcpp.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/29 14:40:58 by felix             #+#    #+#              #
#    Updated: 2022/09/29 15:00:35 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy GCC sources.
cp -r --preserve build/lfs/sources/gcc-8.2.0 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/gcc-8.2.0

# Create GCC build directory
mkdir -v build
cd build

../libstdc++-v3/configure           \
    --host=$LFS_TGT                 \
    --prefix=/tools                 \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-threads     \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/8.2.0

# Build
make

# Install into the tools directory
make install

popd

rm -rf $LFS_TOOLS_PATH/build/gcc-8.2.0
