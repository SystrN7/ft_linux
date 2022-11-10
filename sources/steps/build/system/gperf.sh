# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    gperf.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:05:01 by felix             #+#    #+#              #
#    Updated: 2022/11/10 11:09:07 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/gperf-3.1 /build/gperf-3.1

pushd /build/gperf-3.1

# Create makefile with config
./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1

# Build
make

if [[ "$LFS_TEST_RUN" == "true" ]]; then 
    # Run test
    make -j1 check
fi

# Install
make install

popd

rm -rf /build/gperf-3.1
