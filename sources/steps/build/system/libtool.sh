# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    libtool.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:04:55 by felix             #+#    #+#              #
#    Updated: 2022/11/10 11:18:40 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/libtool-2.4.6 /build/libtool-2.4.6

pushd /build/libtool-2.4.6

# Create makefile with config
./configure --prefix=/usr

# Build
make

if [[ "$LFS_TEST_RUN" == "true" ]]; then 
    # Run test
    make check || echo "Test Faild : $?"
fi

# Install
make install

popd

rm -rf /build/libtool-2.4.6
