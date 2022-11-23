# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    curl.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/11 18:06:51 by felix             #+#    #+#              #
#    Updated: 2022/11/23 19:35:21 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/curl-7.86.0 /build/curl-7.86.0

pushd /build/curl-7.86.0

# Create makefile with config
./configure --prefix=/usr       \
    --disable-static            \
    --enable-threaded-resolver  \
    --with-openssl              \

# Build
make

if [[ "$LFS_TEST_RUN" == "true" ]]; then 
    # Run test
    make test
fi

# Install
make install
# Install docs
rm -rf docs/examples/.deps &&
find docs \( -name Makefile\* -o -name \*.1 -o -name \*.3 \) -exec rm {} \; &&
install -v -d -m755 /usr/share/doc/curl-7.86.0 &&
cp -v -R docs/*     /usr/share/doc/curl-7.86.0

popd

rm -rf /build/curl-7.86.0