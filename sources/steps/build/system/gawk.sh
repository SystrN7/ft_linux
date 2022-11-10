# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    gawk.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:08:11 by felix             #+#    #+#              #
#    Updated: 2022/11/10 10:54:30 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/gawk-4.2.1 /build/gawk-4.2.1

pushd /build/gawk-4.2.1


# Remove useless exctra 
sed -i 's/extras//' Makefile.in

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
# Install docs
mkdir -v /usr/share/doc/gawk-4.2.1
cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-4.2.1

popd

rm -rf /build/gawk-4.2.1
