# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    m4.sh                                              :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/25 15:39:37 by felix             #+#    #+#              #
#    Updated: 2022/10/25 15:44:04 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/m4-1.4.18 /build/m4-1.4.18

pushd /build/m4-1.4.18

# Fix for glibc
sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c
echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h

# Create makefile with config
./configure --prefix=/usr

# Build
make

# Run test
make check

# Install
make install

popd

rm -rf /build/m4-1.4.18