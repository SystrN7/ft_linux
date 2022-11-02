# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    groff.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:08:20 by felix             #+#    #+#              #
#    Updated: 2022/11/02 09:52:32 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/groff-1.22.4 /build/groff-1.22.4

pushd /build/groff-1.22.4

# Create makefile with config (Setup paper size)
PAGE=A4 ./configure --prefix=/usr

# Build
make -j1

# Install
make install

popd

rm -rf /build/groff-1.22.4
