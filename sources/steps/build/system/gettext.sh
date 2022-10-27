# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    gettext.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:06:31 by felix             #+#    #+#              #
#    Updated: 2022/10/27 15:04:19 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/gettext-0.19.8.1 /build/gettext-0.19.8.1

pushd /build/gettext-0.19.8.1

# Remove buggy test (infinit loop)
sed -i '/^TESTS =/d' gettext-runtime/tests/Makefile.in &&
sed -i 's/test-lock..EXEEXT.//' gettext-tools/gnulib-tests/Makefile.in

# Fix Config files
sed -e '/AppData/{N;N;p;s/\.appdata\./.metainfo./}' \
    -i gettext-tools/its/appdata.loc

# Create makefile with config
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/gettext-0.19.8.1

# Build
make

# Run test
make check

# Install
make install
chmod -v 0755 /usr/lib/preloadable_libintl.so

popd

rm -rf /build/gettext-0.19.8.1
