# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    gdb.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/23 22:33:20 by felix             #+#    #+#              #
#    Updated: 2022/11/23 22:53:18 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/gdb-8.2.1 /build/gdb-8.2.1

pushd /build/gdb-8.2.1

# Create makefile with config
./configure --prefix=/usr --with-system-readline

# Build
make

if [[ "$LFS_TEST_RUN" == "true" ]]; then 
    pushd gdb/testsuite &&
        make  site.exp      &&
        echo  "set gdb_test_timeout 120" >> site.exp &&
        runtest || echo "Test Faild : $?"
    popd
fi
# Build docs
# make -C gdb/doc doxy

# Install
make -C gdb install
# Install docs
# install -d /usr/share/doc/gdb-8.2.1 &&
# rm -rf gdb/doc/doxy/xml &&
# cp -Rv gdb/doc/doxy /usr/share/doc/gdb-8.2.1

popd

rm -rf /build/gdb-8.2.1