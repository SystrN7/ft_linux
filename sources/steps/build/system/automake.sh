# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    automake.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:06:17 by felix             #+#    #+#              #
#    Updated: 2022/11/10 11:20:37 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/automake-1.16.1 /build/automake-1.16.1

pushd /build/automake-1.16.1

# Create makefile with config
./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.16.1

# Build
make

if [[ "$LFS_TEST_RUN" == "true" ]]; then 
    # Run test
    make check || echo "Test Faild : $?"
fi

# Install
make install

popd

rm -rf /build/automake-1.16.1
