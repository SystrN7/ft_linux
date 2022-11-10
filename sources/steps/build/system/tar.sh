# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    tar.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/02 10:04:01 by felix             #+#    #+#              #
#    Updated: 2022/11/10 18:37:09 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/tar-1.31 /build/tar-1.31

pushd /build/tar-1.31

# Fix tar bug
sed -i 's/abort.*/FALLTHROUGH;/' src/extract.c

# Create makefile with config
FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr \
            --bindir=/bin

# Build
make

# if [[ "$LFS_TEST_RUN" == "true" ]]; then 
#     # Run test (Tar fill the drive)
#     # make check
# fi

# Install
make install
make -C doc install-html docdir=/usr/share/doc/tar-1.31

popd

rm -rf /build/tar-1.31