# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    kdb.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/02 10:03:38 by felix             #+#    #+#              #
#    Updated: 2022/11/02 10:49:01 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/kbd-2.0.4 /build/kbd-2.0.4

pushd /build/kbd-2.0.4

# Path to fix erase key on i386 keybord
patch -Np1 -i /sources/patchs/kbd-2.0.4-backspace-1.patch

# Remove redondent utils
sed -i 's/\(RESIZECONS_PROGS=\)yes/\1no/g' configure
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in

# Create makefile with config
PKG_CONFIG_PATH=/tools/lib/pkgconfig ./configure --prefix=/usr --disable-vlock

# Build
make

# Run test
make check

# Install
make install
# Install Docs
mkdir -v       /usr/share/doc/kbd-2.0.4 
cp -R -v docs/doc/* /usr/share/doc/kbd-2.0.4

popd

rm -rf /build/kbd-2.0.4