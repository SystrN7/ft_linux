# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    pkg-config.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 09:58:31 by felix             #+#    #+#              #
#    Updated: 2022/11/10 10:58:44 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/pkg-config-0.29.2 /build/pkg-config-0.29.2

pushd /build/pkg-config-0.29.2

# Create makefile with config
./configure --prefix=/usr              \
            --with-internal-glib       \
            --disable-host-tool        \
            --docdir=/usr/share/doc/pkg-config-0.29.2

# Build
make

if [[ "$LFS_TEST_RUN" == "true" ]]; then 
    # Run test
    make check
fi

# Install
make install

popd

rm -rf /build/pkg-config-0.29.2