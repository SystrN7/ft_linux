# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    psmisc.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 09:59:02 by felix             #+#    #+#              #
#    Updated: 2022/10/27 10:56:23 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/psmisc-23.2 /build/psmisc-23.2

pushd /build/psmisc-23.2

# Create makefile with config
./configure --prefix=/usr

# Build
make

# Install
make install

# Fix location to FHS complience
mv -v /usr/bin/fuser   /bin
mv -v /usr/bin/killall /bin

popd

rm -rf /build/psmisc-23.2