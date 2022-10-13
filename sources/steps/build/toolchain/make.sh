# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    make.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/13 15:20:24 by felix             #+#    #+#              #
#    Updated: 2022/10/13 15:32:15 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/make-4.2.1 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/make-4.2.1

sed -i '211,217 d; 219,229 d; 232 d' glob/glob.c

# Create makefile with config
./configure --prefix=/tools --without-guile

# Build
make

# Run test (Faild)
# To see to get more info https://lists.gnu.org/archive/html/bug-make/2017-03/msg00040.html
# make check

# Install
make install

popd

# Remove temps build directory
rm -rf $LFS_TOOLS_PATH/build/make-4.2.1