# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    attr.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 09:58:39 by felix             #+#    #+#              #
#    Updated: 2022/10/27 10:35:58 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/attr-2.4.48 /build/attr-2.4.48

pushd /build/attr-2.4.48

# Create makefile with config
./configure --prefix=/usr     \
            --bindir=/bin     \
            --disable-static  \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/attr-2.4.48

# Build
make

# Run test
make check

# Install
make install

# Fix bad location
mv -v /usr/lib/libattr.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libattr.so) /usr/lib/libattr.so

popd

rm -rf /build/attr-2.4.48