# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    eudev.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/02 10:04:52 by felix             #+#    #+#              #
#    Updated: 2022/11/02 12:26:10 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/eudev-3.2.7 /build/eudev-3.2.7

pushd /build/eudev-3.2.7

cat > config.cache << "EOF"
HAVE_BLKID=1
BLKID_LIBS="-lblkid"
BLKID_CFLAGS="-I/tools/include"
EOF

# Create makefile with config
./configure --prefix=/usr           \
            --bindir=/sbin          \
            --sbindir=/sbin         \
            --libdir=/usr/lib       \
            --sysconfdir=/etc       \
            --libexecdir=/lib       \
            --with-rootprefix=      \
            --with-rootlibdir=/lib  \
            --enable-manpages       \
            --disable-static        \
            --config-cache

# Build
LIBRARY_PATH=/tools/lib make

# Create direcotry
mkdir -pv /lib/udev/rules.d
mkdir -pv /etc/udev/rules.d

# Run test
make LD_LIBRARY_PATH=/tools/lib check

# Install
make LD_LIBRARY_PATH=/tools/lib install

# Install custom LFS rules
cp -r --preserve /sources/udev-lfs-20171102 .
make -f udev-lfs-20171102/Makefile.lfs install

# Create initial hardwareDB
LD_LIBRARY_PATH=/tools/lib udevadm hwdb --update


popd

rm -rf /build/eudev-3.2.7