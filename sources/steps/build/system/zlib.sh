# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    zlib.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/25 15:00:28 by felix             #+#    #+#              #
#    Updated: 2022/10/25 15:17:08 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/zlib-1.2.11 /build/zlib-1.2.11

pushd /build/zlib-1.2.11

# Create makefile with config
./configure --prefix=/usr

# Build
make

# Run test
make check

# Install
make install

# Move lib into the right directorys
mv -v /usr/lib/libz.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libz.so) /usr/lib/libz.so

popd

rm -rf /build/zlib-1.2.11
