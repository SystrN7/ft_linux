# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    bison.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 09:59:10 by felix             #+#    #+#              #
#    Updated: 2022/10/27 11:07:34 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/bison-3.3.2 /build/bison-3.3.2

pushd /build/bison-3.3.2

# Create makefile with config
./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.3.2

# Build
make

# Run test (need flex to test)
# make check

# Install
make install

popd

rm -rf /build/bison-3.3.2