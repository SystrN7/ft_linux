# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    kmod.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:06:27 by felix             #+#    #+#              #
#    Updated: 2022/10/27 15:38:53 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/kmod-26 /build/kmod-26

pushd /build/kmod-26

# Create makefile with config
./configure --prefix=/usr          \
            --bindir=/bin          \
            --sysconfdir=/etc      \
            --with-rootlibdir=/lib \
            --with-xz              \
            --with-zlib

# Build
make

# Install
make install

# Create link for legacy reason
for target in depmod insmod lsmod modinfo modprobe rmmod; do
  ln -sfv ../bin/kmod /sbin/$target
done
ln -sfv kmod /bin/lsmod

popd

rm -rf /build/kmod-26
