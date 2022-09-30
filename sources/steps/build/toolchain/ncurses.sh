# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ncurses.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/30 14:58:10 by felix             #+#    #+#              #
#    Updated: 2022/09/30 15:20:39 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/ncurses-6.1 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/ncurses-6.1

# test if gawk is find
sed -i s/mawk// configure

# Create makefile with config
./configure --prefix=/tools \
            --with-shared   \
            --without-debug \
            --without-ada   \
            --enable-widec  \
            --enable-overwrite

# Build
make

# Install
make install
ln -s libncursesw.so /tools/lib/libncurses.so

popd

# Remove temps build dir
rm -rf $LFS_TOOLS_PATH/build/ncurses-6.1