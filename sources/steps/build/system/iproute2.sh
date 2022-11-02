# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    iproute2.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/02 10:03:34 by felix             #+#    #+#              #
#    Updated: 2022/11/02 10:42:19 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/iproute2-4.20.0 /build/iproute2-4.20.0

pushd /build/iproute2-4.20.0

# Remove Arpd from makfile (is need BerkleyDB to work)
sed -i /ARPD/d Makefile
rm -fv man/man8/arpd.8

# Remove tow module require (iptable)
sed -i 's/.m_ipt.o//' tc/Makefile

# Build
make

# Install
make DOCDIR=/usr/share/doc/iproute2-4.20.0 install

popd

rm -rf /build/iproute2-4.20.0