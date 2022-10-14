# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    build-toolchain.sh                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/13 22:19:37 by felix             #+#    #+#              #
#    Updated: 2022/10/14 15:58:38 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# chmod +x ~/.bashrc
for c in $(env | cut -d '=' -f 1); do unset $c; done
source ~/.bashrc

# For debuging
# cat ~/.bashrc
# env

# Move to the lfs scipts path 
cd $LFS_SCRIPT_PATH

# ================================================= #
# Step 4 : Built temporary system.					#
# ================================================= #

# TODO : Remove this
# Fix env with absolute path
export LFS_PATH=$(pwd)/$LFS_PATH;

# Create temp build directory 
mkdir -vp $LFS_TOOLS_PATH/build/

# Build binutils (Passe 1)
# source ./sources/steps/build/toolchain/binutils.sh

# Build GCC (Passe 1)
# source ./sources/steps/build/toolchain/gcc.sh

# Build (Extract linux header)
# source ./sources/steps/build/toolchain/linux-headers.sh

# Build Glibc
# source ./sources/steps/build/toolchain/glibc.sh

# Test the current stage of build
# source ./sources/steps/build/tests/toolchain-glibc-test.sh

# Build Standard library C++
# source ./sources/steps/build/toolchain/libstdcpp.sh

# Build binutils (Passe 2)
# source ./sources/steps/build/toolchain/binutils-2.sh

# Build GCC (Passe 2)
# source ./sources/steps/build/toolchain/gcc-2.sh

# Test the current stage of build
# source ./sources/steps/build/tests/toolchain-glibc-test.sh

# Build TCL (Test) (Optional)
# source ./sources/steps/build/toolchain/tcl.sh

# Build expect (Test) (Optional)
# source ./sources/steps/build/toolchain/expect.sh

# Build DejaGNU (Test) (Optional)
# source ./sources/steps/build/toolchain/dejagnu.sh

# Build M4
# source ./sources/steps/build/toolchain/m4.sh

# Build Ncurses
# source ./sources/steps/build/toolchain/ncurses.sh

# Build Bash
# source ./sources/steps/build/toolchain/bash.sh

# Build Bison
# source ./sources/steps/build/toolchain/bison.sh

# Build Bzip2
# source ./sources/steps/build/toolchain/bzip2.sh

# Build CoreUtils
# source ./sources/steps/build/toolchain/coreutils.sh

# Build DiffUtils
# source ./sources/steps/build/toolchain/diffutils.sh

# Build File
# source ./sources/steps/build/toolchain/file.sh

# Build FindUtils
# source ./sources/steps/build/toolchain/findutils.sh

# Build Gawk
# source ./sources/steps/build/toolchain/gawk.sh

# Build GetText
# source ./sources/steps/build/toolchain/gettext.sh

# Build Grep
# source ./sources/steps/build/toolchain/grep.sh

# Build Gzip
# source ./sources/steps/build/toolchain/gzip.sh

# Build Make
# source ./sources/steps/build/toolchain/make.sh

# Build Patch
# source ./sources/steps/build/toolchain/patch.sh

# Build Perl
# source ./sources/steps/build/toolchain/perl.sh

# Build Python
# source ./sources/steps/build/toolchain/python.sh

# Build Sed
# source ./sources/steps/build/toolchain/sed.sh

# Build Tar
source ./sources/steps/build/toolchain/tar.sh
