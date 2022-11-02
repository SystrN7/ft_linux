# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    gdbm.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:04:58 by felix             #+#    #+#              #
#    Updated: 2022/11/02 10:19:54 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/gdbm-1.18.1 /build/gdbm-1.18.1

pushd /build/gdbm-1.18.1

# Create makefile with config
./configure --prefix=/usr    \
            --disable-static \
            --enable-libgdbm-compat

# Build
make

# Run test
make check

# Install
make install

popd

rm -rf /build/gdbm-1.18.1
