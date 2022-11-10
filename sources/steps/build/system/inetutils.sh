# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    inetutils.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:05:47 by felix             #+#    #+#              #
#    Updated: 2022/11/10 11:18:26 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/inetutils-1.9.4 /build/inetutils-1.9.4

pushd /build/inetutils-1.9.4

# Create makefile with config
./configure --prefix=/usr        \
            --localstatedir=/var \
            --disable-logger     \
            --disable-whois      \
            --disable-rcp        \
            --disable-rexec      \
            --disable-rlogin     \
            --disable-rsh        \
            --disable-servers

# Build
make

if [[ "$LFS_TEST_RUN" == "true" ]]; then 
    # Run test
    make check || echo "Test Faild : $?"
fi

# Install
make install

# Fix program location
mv -v /usr/bin/{hostname,ping,ping6,traceroute} /bin
mv -v /usr/bin/ifconfig /sbin

popd

rm -rf /build/inetutils-1.9.4
