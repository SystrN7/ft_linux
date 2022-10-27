# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    openssl.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:07:12 by felix             #+#    #+#              #
#    Updated: 2022/10/27 15:57:02 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/openssl-1.1.1a /build/openssl-1.1.1a

pushd /build/openssl-1.1.1a

# Create makefile with config
./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic

# Build
make

# Run test
make test || echo "Test faild : $?"

# Install
sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
make MANSUFFIX=ssl install
# Install Docs
mv -v /usr/share/doc/openssl /usr/share/doc/openssl-1.1.1a
cp -vfr doc/* /usr/share/doc/openssl-1.1.1a

popd

rm -rf /build/openssl-1.1.1a
