# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    readline.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/25 15:31:23 by felix             #+#    #+#              #
#    Updated: 2022/10/25 15:37:46 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/readline-8.0 /build/readline-8.0

pushd /build/readline-8.0

# Prevent linker bug
sed -i '/MV.*old/d' Makefile.in
sed -i '/{OLDSUFF}/c:' support/shlib-install

# Create makefile with config
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/readline-8.0

# Build
make SHLIB_LIBS="-L/tools/lib -lncursesw"

# Install
make SHLIB_LIBS="-L/tools/lib -lncursesw" install

# Move to the right directory and fix permision
mv -v /usr/lib/lib{readline,history}.so.* /lib
chmod -v u+w /lib/lib{readline,history}.so.*
ln -sfv ../../lib/$(readlink /usr/lib/libreadline.so) /usr/lib/libreadline.so
ln -sfv ../../lib/$(readlink /usr/lib/libhistory.so ) /usr/lib/libhistory.so

# Install docs
install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-8.0

popd

rm -rf /build/readline-8.0