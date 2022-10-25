# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    man.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/29 10:38:00 by felix             #+#    #+#              #
#    Updated: 2022/10/25 10:10:39 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy linux kernel sources.
cp -r --preserve /sources/man-pages-4.16 /build/man-pages-4.16

pushd /build/man-pages-4.16

# Intstall
make install

popd

rm -rf /build/man-pages-4.16
