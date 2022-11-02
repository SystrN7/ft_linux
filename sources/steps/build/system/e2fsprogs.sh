# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    e2fsprogs.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/02 10:04:36 by felix             #+#    #+#              #
#    Updated: 2022/11/02 11:54:44 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/e2fsprogs-1.44.5 /build/e2fsprogs-1.44.5

pushd /build/e2fsprogs-1.44.5

# Create build directory
mkdir -v build
cd build

# Create makefile with config
../configure --prefix=/usr           \
             --bindir=/bin           \
             --with-root-prefix=""   \
             --enable-elf-shlibs     \
             --disable-libblkid      \
             --disable-libuuid       \
             --disable-uuidd         \
             --disable-fsck

# Build
make

# Run test
make check

# Install
make install
# Install libs
make install-libs

# Update system dir file
gunzip -v /usr/share/info/libext2fs.info.gz
install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info

# Install docs
makeinfo -o      doc/com_err.info ../lib/et/com_err.texinfo
install -v -m644 doc/com_err.info /usr/share/info
install-info --dir-file=/usr/share/info/dir /usr/share/info/com_err.info

popd

rm -rf /build/e2fsprogs-1.44.5