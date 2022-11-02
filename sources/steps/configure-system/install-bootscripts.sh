# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install-bootscritpts.sh                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/02 14:48:07 by felix             #+#    #+#              #
#    Updated: 2022/11/02 14:49:31 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/lfs-bootscripts-20180820 /build/lfs-bootscripts-20180820

pushd /build/lfs-bootscripts-20180820

# Install
make install

popd

rm -rf /build/lfs-bootscripts-20180820