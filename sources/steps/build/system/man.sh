# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    man.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/29 10:38:00 by felix             #+#    #+#              #
#    Updated: 2022/10/21 16:03:25 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy linux kernel sources.
cp -r --preserve /sources/man-pages-4.16 /build/

pushd /build/man-pages-4.16

# Intstall
make install

popd

rm -rf /build/man-pages-4.16
