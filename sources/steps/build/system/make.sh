# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    make.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/02 10:03:49 by felix             #+#    #+#              #
#    Updated: 2022/11/10 11:10:49 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/make-4.2.1 /build/make-4.2.1

pushd /build/make-4.2.1

# Fix Glibc 2.27 error
sed -i '211,217 d; 219,229 d; 232 d' glob/glob.c

# Create makefile with config
./configure --prefix=/usr

# Build
make

if [[ "$LFS_TEST_RUN" == "true" ]]; then 
    # Run test
    make PERL5LIB=$PWD/tests/ check
fi

# Install
make install

popd

rm -rf /build/make-4.2.1