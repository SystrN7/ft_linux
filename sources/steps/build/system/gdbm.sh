# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    gdbm.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:04:58 by felix             #+#    #+#              #
#    Updated: 2022/10/27 14:24:45 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/gperf-3.1 /build/gperf-3.1

pushd /build/gperf-3.1

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

rm -rf /build/gperf-3.1
