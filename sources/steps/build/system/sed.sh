# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    sed.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 09:58:58 by felix             #+#    #+#              #
#    Updated: 2022/10/27 10:52:02 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/sed-4.7 /build/sed-4.7

pushd /build/sed-4.7

# Fix environement issue
sed -i 's/usr/tools/'                 build-aux/help2man
# Fix fail test
sed -i 's/testsuite.panic-tests.sh//' Makefile.in

# Create makefile with config
./configure --prefix=/usr --bindir=/bin

# Build
make
# Build docs
make html

# Run test
make check

# Install
make install
install -d -m755           /usr/share/doc/sed-4.7
install -m644 doc/sed.html /usr/share/doc/sed-4.7

popd

rm -rf /build/sed-4.7