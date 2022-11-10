# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    intltool.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:06:04 by felix             #+#    #+#              #
#    Updated: 2022/11/10 10:55:32 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/intltool-0.51.0 /build/intltool-0.51.0

pushd /build/intltool-0.51.0

# Fix Perl warrning
sed -i 's:\\\${:\\\$\\{:' intltool-update.in

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
install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO

popd

rm -rf /build/intltool-0.51.0
