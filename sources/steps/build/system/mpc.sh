# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mpc.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/26 17:03:30 by felix             #+#    #+#              #
#    Updated: 2022/10/26 17:04:21 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/mpc-1.1.0 /build/mpc-1.1.0

pushd /build/mpc-1.1.0

# Create makefile with config
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/mpc-1.1.0

# Build
make
# Build docs
make html

# Run test
make check

# Install
make install
# Intsall docs
make install-html

popd

rm -rf /build/mpc-1.1.0