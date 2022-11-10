# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    grep.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 09:59:24 by felix             #+#    #+#              #
#    Updated: 2022/11/10 11:09:18 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/grep-3.3 /build/grep-3.3

pushd /build/grep-3.3

# Create makefile with config
./configure --prefix=/usr --bindir=/bin

# Build
make

if [[ "$LFS_TEST_RUN" == "true" ]]; then 
    # Run test
    make -k check
fi

# Install
make install

popd

rm -rf /build/grep-3.3