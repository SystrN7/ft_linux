# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    gmp.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/25 17:23:39 by felix             #+#    #+#              #
#    Updated: 2022/10/26 16:55:30 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/gmp-6.1.2 /build/gmp-6.1.2

pushd /build/gmp-6.1.2

# Create makefile with config
./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/gmp-6.1.2

# Build
make

# Build docs
make html

# Run test
make check 2>&1 | tee gmp-check-log
# Print result
awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log

# Install
make install
# Install Docs
make install-html

popd

rm -rf /build/gmp-6.1.2