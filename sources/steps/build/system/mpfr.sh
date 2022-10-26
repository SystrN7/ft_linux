# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mpfr.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/26 16:56:57 by felix             #+#    #+#              #
#    Updated: 2022/10/26 16:59:26 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/mpfr-4.0.2 /build/mpfr-4.0.2

pushd /build/mpfr-4.0.2

# Create makefile with config
./configure --prefix=/usr        \
            --disable-static     \
            --enable-thread-safe \
            --docdir=/usr/share/doc/mpfr-4.0.2

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

rm -rf /build/mpfr-4.0.2