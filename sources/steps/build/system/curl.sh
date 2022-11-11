# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    curl.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/11 18:06:51 by felix             #+#    #+#              #
#    Updated: 2022/11/11 18:08:22 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/curl-7.86.0 /build/curl-7.86.0

pushd /build/curl-7.86.0

# Create makefile with config
./configure --prefix=/usr --with-openssl

# Build
make

if [[ "$LFS_TEST_RUN" == "true" ]]; then 
    # Run test
    make test
fi

# Install
make install

popd

rm -rf /build/curl-7.86.0