# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    libcap.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 09:58:53 by felix             #+#    #+#              #
#    Updated: 2022/10/27 10:47:05 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/libcap-2.26 /build/libcap-2.26

pushd /build/libcap-2.26

# Prevent static lib install
sed -i '/install.*STALIBNAME/d' libcap/Makefile

# Build
make

# Install
make RAISE_SETFCAP=no lib=lib prefix=/usr install
chmod -v 755 /usr/lib/libcap.so.2.26

# Fix lib location
mv -v /usr/lib/libcap.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libcap.so) /usr/lib/libcap.so

popd

rm -rf /build/libcap-2.26