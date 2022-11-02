# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    findutils.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:08:17 by felix             #+#    #+#              #
#    Updated: 2022/11/02 09:40:07 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/findutils-4.6.0 /build/findutils-4.6.0

pushd /build/findutils-4.6.0

# Remove buggy test (infinit loop)
sed -i 's/test-lock..EXEEXT.//' tests/Makefile.in

# Fix for this glibc 2.28 and greater
sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' gl/lib/*.c
sed -i '/unistd/a #include <sys/sysmacros.h>' gl/lib/mountlist.c
echo "#define _IO_IN_BACKUP 0x100" >> gl/lib/stdio-impl.h

# Create makefile with config
./configure --prefix=/usr --localstatedir=/var/lib/locate

# Build
make

# Run test
make check

# Install
make install

# Fix for bootscript (move location)
mv -v /usr/bin/find /bin
sed -i 's|find:=${BINDIR}|find:=/bin|' /usr/bin/updatedb

popd

rm -rf /build/findutils-4.6.0
