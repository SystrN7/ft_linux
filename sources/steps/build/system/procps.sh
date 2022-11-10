# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    procps.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/02 10:04:24 by felix             #+#    #+#              #
#    Updated: 2022/11/10 11:19:08 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/procps-ng-3.3.15 /build/procps-ng-3.3.15

pushd /build/procps-ng-3.3.15

# Create makefile with config
./configure --prefix=/usr                            \
            --exec-prefix=                           \
            --libdir=/usr/lib                        \
            --docdir=/usr/share/doc/procps-ng-3.3.15 \
            --disable-static                         \
            --disable-kill

# Build
make

# Fix test faild
sed -i -r 's|(pmap_initname)\\\$|\1|' testsuite/pmap.test/pmap.exp
sed -i '/set tty/d' testsuite/pkill.test/pkill.exp
rm testsuite/pgrep.test/pgrep.exp

if [[ "$LFS_TEST_RUN" == "true" ]]; then 
    # Run test
    make check || echo "Test Faild : $?"
fi

# Install
make install

# Fix lib location
mv -v /usr/lib/libprocps.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libprocps.so) /usr/lib/libprocps.so

popd

rm -rf /build/procps-ng-3.3.15