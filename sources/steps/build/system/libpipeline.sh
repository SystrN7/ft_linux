# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    libpipeline.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/02 10:03:42 by felix             #+#    #+#              #
#    Updated: 2022/11/02 10:14:50 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/libpipeline-1.5.1 /build/libpipeline-1.5.1

pushd /build/libpipeline-1.5.1

# Create makefile with config
./configure --prefix=/usr

# Build
make

# Run test
make check

# Install
make install

popd

rm -rf /build/libpipeline-1.5.1