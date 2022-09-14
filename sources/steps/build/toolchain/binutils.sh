# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    binutils.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/03 18:14:57 by felix             #+#    #+#              #
#    Updated: 2022/04/03 18:20:44 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

mkdir -v build
cd build

# Create makefile with config
../configure --prefix=/tools            \
             --with-sysroot=$LFS        \
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