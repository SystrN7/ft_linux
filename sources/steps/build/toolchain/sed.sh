# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    sed.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/14 15:46:05 by felix             #+#    #+#              #
#    Updated: 2022/11/10 10:44:11 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/sed-4.7 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/sed-4.7

# Create makefile with config
./configure --prefix=/tools

# Build
make

if [[ "$LFS_TEST_RUN" == "true" ]]; then
    # Run test
    make check
fi

# Install
make install

popd

# Remove temps build directory
rm -rf $LFS_TOOLS_PATH/build/sed-4.7