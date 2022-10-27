# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    autoconf.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:06:12 by felix             #+#    #+#              #
#    Updated: 2022/10/27 15:12:41 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/autoconf-2.69 /build/autoconf-2.69

pushd /build/autoconf-2.69

# Fix Perl 5.28 bug
sed '361 s/{/\\{/' -i bin/autoscan.in

# Create makefile with config
./configure --prefix=/usr

# Build
make

# Run test
make check || echo "Test faild : $?"

# Install
make install

popd

rm -rf /build/autoconf-2.69
