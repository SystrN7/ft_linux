# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    iana-etc.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 09:59:06 by felix             #+#    #+#              #
#    Updated: 2022/10/27 11:03:18 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/iana-etc-2.30 /build/iana-etc-2.30

pushd /build/iana-etc-2.30

# Build
make

# Install
make install

popd

rm -rf /build/iana-etc-2.30