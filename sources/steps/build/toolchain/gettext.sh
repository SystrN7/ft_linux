# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    gettext.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/13 14:59:29 by felix             #+#    #+#              #
#    Updated: 2022/10/13 15:03:21 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/gettext-0.19.8.1 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/gettext-0.19.8.1

# Create makefile with config
cd gettext-tools
EMACS="no" ./configure --prefix=/tools --disable-shared

# Build
make -C gnulib-lib
make -C intl pluralx.c
make -C src msgfmt
make -C src msgmerge
make -C src xgettext

# Install
cp -v src/{msgfmt,msgmerge,xgettext} /tools/bin

popd

# Remove temps build directory
rm -rf $LFS_TOOLS_PATH/build/gettext-0.19.8.1

