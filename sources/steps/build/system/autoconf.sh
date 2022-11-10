# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    autoconf.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:06:12 by felix             #+#    #+#              #
#    Updated: 2022/11/10 11:20:41 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/autoconf-2.69 /build/autoconf-2.69

pushd /build/autoconf-2.69

# Fix Perl 5.28 bug
sed '361 s/{/\\{/' -i bin/autoscan.in

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

rm -rf /build/autoconf-2.69
