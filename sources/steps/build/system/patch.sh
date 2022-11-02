# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    patch.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/02 10:03:55 by felix             #+#    #+#              #
#    Updated: 2022/11/02 10:08:54 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/patch-2.7.6 /build/patch-2.7.6

pushd /build/patch-2.7.6

# Create makefile with config
./configure --prefix=/usr

# Build
make

# Run test
make check

# Install
make install

popd

rm -rf /build/patch-2.7.6