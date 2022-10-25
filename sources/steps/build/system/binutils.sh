# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    binutils.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/25 16:35:07 by felix             #+#    #+#              #
#    Updated: 2022/10/25 17:20:26 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Run test to check environements
ENV_TEST_RESULT=$(expect -c "spawn ls")
ENV_TEST_EXPECT=$(echo "spawn ls"$'\r')
if test "$ENV_TEST_RESULT" != "$ENV_TEST_EXPECT"; then
    echo "You tty is not well configured !";
    exit 1
fi
unset ENV_TEST_EXPECT
unset ENV_TEST_RESULT


# Copy sources.
cp -r --preserve /sources/binutils-2.32 /build/binutils-2.32

pushd /build/binutils-2.32

# Create build directory
mkdir -v build
cd       build

# Create makefile with config
../configure --prefix=/usr       \
             --enable-gold       \
             --enable-ld=default \
             --enable-plugins    \
             --enable-shared     \
             --disable-werror    \
             --enable-64-bit-bfd \
             --with-system-zlib

# Build
make tooldir=/usr

# Run test
make -k check

# Install
make tooldir=/usr install

popd

rm -rf /build/binutils-2.32