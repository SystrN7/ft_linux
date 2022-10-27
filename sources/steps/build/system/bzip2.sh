# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    bzip2.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 09:57:59 by felix             #+#    #+#              #
#    Updated: 2022/10/27 10:12:08 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/bzip2-1.0.6 /build/bzip2-1.0.6

pushd /build/bzip2-1.0.6

# Patch sources
patch -Np1 -i /sources/patchs/bzip2-1.0.6-install_docs-1.patch

# Add relative symbolic link
sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile

# Fix man page location
sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile


# Prepare build
make -f Makefile-libbz2_so
make clean

# Build
make

# Install
make PREFIX=/usr install

# Install binarys + create symbolic link + clean
cp -v bzip2-shared /bin/bzip2
cp -av libbz2.so* /lib
ln -sv ../../lib/libbz2.so.1.0 /usr/lib/libbz2.so
rm -v /usr/bin/{bunzip2,bzcat,bzip2}
ln -sv bzip2 /bin/bunzip2
ln -sv bzip2 /bin/bzcat

popd

rm -rf /build/bzip2-1.0.6