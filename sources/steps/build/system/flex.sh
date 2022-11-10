# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    flex.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 09:59:17 by felix             #+#    #+#              #
#    Updated: 2022/11/10 10:54:26 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/flex-2.6.4 /build/flex-2.6.4

pushd /build/flex-2.6.4

# Fix Glibc 2.26 issus
sed -i "/math.h/a #include <malloc.h>" src/flexdef.h

# Create makefile with config
HELP2MAN=/tools/bin/true \
./configure --prefix=/usr --docdir=/usr/share/doc/flex-2.6.4

# Build
make

if [[ "$LFS_TEST_RUN" == "true" ]]; then 
    # Run test
    make check
fi

# Install
make install

# Create link for leagcy utils lex
ln -s flex /usr/bin/lex

popd

rm -rf /build/flex-2.6.4