# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    less.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/02 10:03:15 by felix             #+#    #+#              #
#    Updated: 2022/11/02 10:26:39 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/less-530 /build/less-530

pushd /build/less-530

# Create makefile with config
./configure --prefix=/usr --sysconfdir=/etc

# Build
make

# Install
make install

popd

rm -rf /build/less-530