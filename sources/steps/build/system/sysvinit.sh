# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    sysvinit.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/02 10:04:48 by felix             #+#    #+#              #
#    Updated: 2022/11/02 12:14:52 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/sysvinit-2.93 /build/sysvinit-2.93

pushd /build/sysvinit-2.93

patch -Np1 -i /sources/patchs/sysvinit-2.93-consolidated-1.patch

# Build
make

# Install
make install

popd

rm -rf /build/sysvinit-2.93