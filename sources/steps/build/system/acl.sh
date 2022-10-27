# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    acl.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 09:58:48 by felix             #+#    #+#              #
#    Updated: 2022/10/27 10:40:02 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/acl-2.2.53 /build/acl-2.2.53

pushd /build/acl-2.2.53

# Create makefile with config
./configure --prefix=/usr         \
            --bindir=/bin         \
            --disable-static      \
            --libexecdir=/usr/lib \
            --docdir=/usr/share/doc/acl-2.2.53

# Build
make

# Install
make install

# Fix bad location
mv -v /usr/lib/libacl.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libacl.so) /usr/lib/libacl.so

popd

rm -rf /build/acl-2.2.53