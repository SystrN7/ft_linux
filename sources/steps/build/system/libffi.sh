# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    libffi.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:07:01 by felix             #+#    #+#              #
#    Updated: 2022/10/27 15:29:40 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/libffi-3.2.1 /build/libffi-3.2.1

pushd /build/libffi-3.2.1

# Fix header path to install into the right directory
sed -e '/^includesdir/ s/$(libdir).*$/$(includedir)/' \
    -i include/Makefile.in

sed -e '/^includedir/ s/=.*$/=@includedir@/' \
    -e 's/^Cflags: -I${includedir}/Cflags:/' \
    -i libffi.pc.in

# Create makefile with config (posibly require fix if wont boot)
./configure --prefix=/usr --disable-static --with-gcc-arch=native

# Build
make

# Run test
make check

# Install
make install

popd

rm -rf /build/libffi-3.2.1
