# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    textinfo.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/14 15:50:07 by felix             #+#    #+#              #
#    Updated: 2022/11/10 11:19:25 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/texinfo-6.5 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/texinfo-6.5

# Create makefile with config
./configure --prefix=/tools

# Build
make

if [[ "$LFS_TEST_RUN" == "true" ]]; then
    # Run test (Multiple test failed)
    make check || echo "Test Faild : $?"
fi

# Install
make install

popd

# Remove temps build directory
rm -rf $LFS_TOOLS_PATH/build/texinfo-6.5