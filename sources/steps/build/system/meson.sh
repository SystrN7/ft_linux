# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    meson.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:07:45 by felix             #+#    #+#              #
#    Updated: 2022/10/27 16:06:31 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/meson-0.49.2 /build/meson-0.49.2

pushd /build/meson-0.49.2

# Build
python3 setup.py build

# Install
python3 setup.py install --root=dest
cp -rv dest/* /

popd

rm -rf /build/meson-0.49.2
