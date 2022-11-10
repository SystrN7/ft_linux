# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    m4.sh                                              :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/30 14:58:10 by felix             #+#    #+#              #
#    Updated: 2022/11/10 10:42:55 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/m4-1.4.18 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/m4-1.4.18

# Applies fix to sources
sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c
echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h

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

# Remove temps build dir
rm -rf $LFS_TOOLS_PATH/build/m4-1.4.18