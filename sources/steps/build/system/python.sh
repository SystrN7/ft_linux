# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    python.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:07:18 by felix             #+#    #+#              #
#    Updated: 2022/10/27 16:32:32 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/Python-3.7.2 /build/Python-3.7.2

pushd /build/Python-3.7.2

# Create makefile with config
./configure --prefix=/usr       \
            --enable-shared     \
            --with-system-expat \
            --with-system-ffi   \
            --with-ensurepip=yes

# Build
make

# Install
make install
chmod -v 755 /usr/lib/libpython3.7m.so
chmod -v 755 /usr/lib/libpython3.so
# Install Docs
install -v -dm755 /usr/share/doc/python-3.7.2/html
cp -r --no-preserve=mode,ownership /sources/python-3.7.2-docs-html /usr/share/doc/python-3.7.2/html

popd

rm -rf /build/Python-3.7.2