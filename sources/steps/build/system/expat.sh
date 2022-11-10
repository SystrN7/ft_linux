# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    expat.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:05:41 by felix             #+#    #+#              #
#    Updated: 2022/11/10 10:54:12 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/expat-2.2.6 /build/expat-2.2.6

pushd /build/expat-2.2.6

# Fix test faild in LFS environement
sed -i 's|usr/bin/env |bin/|' run.sh.in

# Create makefile with config
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/expat-2.2.6

# Build
make

if [[ "$LFS_TEST_RUN" == "true" ]]; then 
    # Run test
    make check
fi

# Install
make install
# Install docs
install -v -m644 doc/*.{html,png,css} /usr/share/doc/expat-2.2.6

popd

rm -rf /build/expat-2.2.6
