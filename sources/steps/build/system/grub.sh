# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    grub.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:08:24 by felix             #+#    #+#              #
#    Updated: 2022/11/02 09:55:16 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/grub-2.02 /build/grub-2.02

pushd /build/grub-2.02

# Create makefile with config
./configure --prefix=/usr          \
            --sbindir=/sbin        \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror

# Build
make

# Install
make install
mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions

popd

rm -rf /build/grub-2.02
