# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    bash.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/30 14:58:10 by felix             #+#    #+#              #
#    Updated: 2022/11/10 11:19:15 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/bash-5.0 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/bash-5.0


# Create makefile with config
./configure --prefix=/tools --without-bash-malloc

# Build
make

if [[ "$LFS_TEST_RUN" == "true" ]]; then
    # Run test
    make tests || echo "Test Faild : $?"
fi

# Install
make install
ln -sv bash /tools/bin/sh

popd

# Remove temps build directory
rm -rf $LFS_TOOLS_PATH/build/bash-5.0