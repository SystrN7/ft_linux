# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    file.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/25 15:00:28 by felix             #+#    #+#              #
#    Updated: 2022/10/25 15:19:30 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/file-5.36 /build/file-5.36

pushd /build/file-5.36

# Create makefile with config
./configure --prefix=/usr

# Build
make

# Run test
make check

# Install
make install

popd

rm -rf /build/file-5.36
