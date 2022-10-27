# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    perl.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:05:52 by felix             #+#    #+#              #
#    Updated: 2022/10/27 14:46:12 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/perl-5.28.1 /build/perl-5.28.1

pushd /build/perl-5.28.1

# Create basic host file
echo "127.0.0.1 localhost $(hostname)" > /etc/hosts

# Config to use install system lib
export BUILD_ZLIB=False
export BUILD_BZIP2=0

# Create makefile with config
sh Configure -des -Dprefix=/usr                 \
                  -Dvendorprefix=/usr           \
                  -Dman1dir=/usr/share/man/man1 \
                  -Dman3dir=/usr/share/man/man3 \
                  -Dpager="/usr/bin/less -isR"  \
                  -Duseshrplib                  \
                  -Dusethreads

# Build
make

# Run test
make -k test || echo "Test faild : $?"

# Install
make install

# Remove temps vars
unset BUILD_ZLIB BUILD_BZIP2

popd

rm -rf /build/perl-5.28.1
