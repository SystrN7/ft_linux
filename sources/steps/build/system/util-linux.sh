# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    util-linux.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/02 10:04:32 by felix             #+#    #+#              #
#    Updated: 2022/11/02 11:44:27 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/util-linux-2.33.1 /build/util-linux-2.33.1

pushd /build/util-linux-2.33.1

# Use an other directory for FHS Compliance (hwclock)
mkdir -pv /var/lib/hwclock

# Remove old symbolic link
rm -vf /usr/include/{blkid,libmount,uuid}

# Create makefile with config
./configure ADJTIME_PATH=/var/lib/hwclock/adjtime   \
            --docdir=/usr/share/doc/util-linux-2.33.1 \
            --disable-chfn-chsh  \
            --disable-login      \
            --disable-nologin    \
            --disable-su         \
            --disable-setpriv    \
            --disable-runuser    \
            --disable-pylibmount \
            --disable-static     \
            --without-python     \
            --without-systemd    \
            --without-systemdsystemunitdir

# Build
make

# Run test
# chown -Rv nobody .
# su nobody -s /bin/bash -c "PATH=$PATH make -k check"

# Install
make install

popd

rm -rf /build/util-linux-2.33.1