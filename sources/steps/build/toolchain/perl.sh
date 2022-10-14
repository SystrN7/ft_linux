# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    perl.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/13 17:25:31 by felix             #+#    #+#              #
#    Updated: 2022/10/13 17:32:17 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/perl-5.28.1 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/perl-5.28.1

# Create makefile with config
sh Configure -des -Dprefix=/tools -Dlibs=-lm -Uloclibpth -Ulocincpth

# Build
make

# Install
cp -v perl cpan/podlators/scripts/pod2man /tools/bin
mkdir -pv /tools/lib/perl5/5.28.1
cp -Rv lib/* /tools/lib/perl5/5.28.1

popd

# Remove temps build directory
rm -rf $LFS_TOOLS_PATH/build/perl-5.28.1