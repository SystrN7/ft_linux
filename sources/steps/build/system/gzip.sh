# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    gzip.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/02 10:03:22 by felix             #+#    #+#              #
#    Updated: 2022/11/10 11:09:34 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/gzip-1.10 /build/gzip-1.10

pushd /build/gzip-1.10

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
mv -v /usr/bin/gzip /bin

popd

rm -rf /build/gzip-1.10