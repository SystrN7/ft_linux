# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    man-db.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/02 10:03:58 by felix             #+#    #+#              #
#    Updated: 2022/11/10 10:57:56 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/man-db-2.8.5 /build/man-db-2.8.5

pushd /build/man-db-2.8.5

# Create makefile with config
./configure --prefix=/usr                        \
            --docdir=/usr/share/doc/man-db-2.8.5 \
            --sysconfdir=/etc                    \
            --disable-setuid                     \
            --enable-cache-owner=bin             \
            --with-browser=/usr/bin/lynx         \
            --with-vgrind=/usr/bin/vgrind        \
            --with-grap=/usr/bin/grap            \
            --with-systemdtmpfilesdir=           \
            --with-systemdsystemunitdir=

# Build
make

if [[ "$LFS_TEST_RUN" == "true" ]]; then 
    # Run test
    make check
fi

# Install
make install

popd

rm -rf /build/man-db-2.8.5