# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    xz.sh                                              :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:06:22 by felix             #+#    #+#              #
#    Updated: 2022/10/27 14:54:52 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/xz-5.2.4 /build/xz-5.2.4

pushd /build/xz-5.2.4

# Create makefile with config
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/xz-5.2.4

# Build
make

# Run test
make check

# Install
make install
mv -v   /usr/bin/{lzma,unlzma,lzcat,xz,unxz,xzcat} /bin
mv -v /usr/lib/liblzma.so.* /lib
ln -svf ../../lib/$(readlink /usr/lib/liblzma.so) /usr/lib/liblzma.so

popd

rm -rf /build/xz-5.2.4
