# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    bc.sh                                              :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/25 15:49:39 by felix             #+#    #+#              #
#    Updated: 2022/11/10 11:04:32 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/bc-1.07.1 /build/bc-1.07.1

pushd /build/bc-1.07.1

# Fix to use sed insted of ed command
cat > bc/fix-libmath_h << "EOF"
#! /bin/bash
sed -e '1   s/^/{"/' \
    -e     's/$/",/' \
    -e '2,$ s/^/"/'  \
    -e   '$ d'       \
    -i libmath.h

sed -e '$ s/$/0}/' \
    -i libmath.h
EOF

# Temps Fix to find libs readline and curse in the system
ln -sv /tools/lib/libncursesw.so.6 /usr/lib/libncursesw.so.6
ln -sfv libncursesw.so.6 /usr/lib/libncurses.so

# Fix configure
sed -i -e '/flex/s/as_fn_error/: ;; # &/' configure


# Create makefile with config
./configure --prefix=/usr           \
            --with-readline         \
            --mandir=/usr/share/man \
            --infodir=/usr/share/info

# Build
make

if [[ "$LFS_TEST_RUN" == "true" ]]; then 
    # Run test
    echo "quit" | ./bc/bc -l Test/checklib.b
fi

# Install
make install

popd

rm -rf /build/bc-1.07.1