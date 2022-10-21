# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    linux-headers.sh                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/29 10:38:00 by felix             #+#    #+#              #
#    Updated: 2022/10/21 15:45:05 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy linux kernel sources.
cp -r --preserve /sources/linux-4.20.12 /build/

pushd /build/linux-4.20.12

# Clean up the linux sources
make mrproper

# Install and move the linux kernel header to the right directory
make INSTALL_HDR_PATH=dest headers_install
find dest/include \( -name .install -o -name ..install.cmd \) -delete
cp -rv dest/include/* /usr/include

popd

rm -rf /build/linux-4.20.12
