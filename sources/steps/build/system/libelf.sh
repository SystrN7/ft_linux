# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    libelf.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:06:44 by felix             #+#    #+#              #
#    Updated: 2022/10/27 15:24:23 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/elfutils-0.176 /build/elfutils-0.176

pushd /build/elfutils-0.176

# Create makefile with config
./configure --prefix=/usr

# Build
make

# Run test
make check

# Install
make -C libelf install
install -vm644 config/libelf.pc /usr/lib/pkgconfig

popd

rm -rf /build/elfutils-0.176
