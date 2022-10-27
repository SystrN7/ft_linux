# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ncurses.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 09:58:35 by felix             #+#    #+#              #
#    Updated: 2022/10/27 10:31:42 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/ncurses-6.1 /build/ncurses-6.1

pushd /build/ncurses-6.1

# Prevent unsupported libs by configure
sed -i '/LIBTOOL_INSTALL/d' c++/Makefile.in

# Create makefile with config
./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --with-shared           \
            --without-debug         \
            --without-normal        \
            --enable-pc-files       \
            --enable-widec

# Build
make

# Install
make install

# Fix lib location\
mv -v /usr/lib/libncursesw.so.6* /lib
# Repare broken link
ln -sfv ../../lib/$(readlink /usr/lib/libncursesw.so) /usr/lib/libncursesw.so

# Redirect non wide to wide libs for leagacy support
for lib in ncurses form panel menu ; do
    rm -vf                    /usr/lib/lib${lib}.so
    echo "INPUT(-l${lib}w)" > /usr/lib/lib${lib}.so
    ln -sfv ${lib}w.pc        /usr/lib/pkgconfig/${lib}.pc
done

# Test if old apps can compile with old lib
rm -vf                     /usr/lib/libcursesw.so
echo "INPUT(-lncursesw)" > /usr/lib/libcursesw.so
ln -sfv libncurses.so      /usr/lib/libcurses.so

# Install Docs
mkdir -v       /usr/share/doc/ncurses-6.1
cp -v -R doc/* /usr/share/doc/ncurses-6.1

# Recompile for LSB compliance
make distclean
./configure --prefix=/usr    \
            --with-shared    \
            --without-normal \
            --without-debug  \
            --without-cxx-binding \
            --with-abi-version=5 
make sources libs
cp -av lib/lib*.so.5* /usr/lib

popd

rm -rf /build/ncurses-6.1