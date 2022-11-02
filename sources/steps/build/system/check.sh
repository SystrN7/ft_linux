# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    check.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:07:59 by felix             #+#    #+#              #
#    Updated: 2022/11/02 09:00:47 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/check-0.12.0 /build/check-0.12.0

pushd /build/check-0.12.0

# Create makefile with config
./configure --prefix=/usr

# Build
make

# Run test
make check

# Install
make install
# Fix script
sed -i '1 s/tools/usr/' /usr/bin/checkmk

popd

rm -rf /build/check-0.12.0
