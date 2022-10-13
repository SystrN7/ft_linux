# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    bzip2.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/11 16:16:29 by felix             #+#    #+#              #
#    Updated: 2022/10/13 10:42:23 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/bzip2-1.0.6 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/bzip2-1.0.6

# Build
make

# Install
make PREFIX=/tools install

popd

# Remove temps build directory
rm -rf $LFS_TOOLS_PATH/build/bzip2-1.0.6