# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    diffutils.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:08:03 by felix             #+#    #+#              #
#    Updated: 2022/11/10 10:53:47 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/diffutils-3.7 /build/diffutils-3.7

pushd /build/diffutils-3.7

# Create makefile with config
./configure --prefix=/usr

# Build
make

if [[ "$LFS_TEST_RUN" == "true" ]]; then 
    # Run test
    make check
fi

# Install
make install

popd

rm -rf /build/diffutils-3.7
