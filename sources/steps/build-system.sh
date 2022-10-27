# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    build-system.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/18 10:34:18 by felix             #+#    #+#              #
#    Updated: 2022/10/27 15:38:03 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Debug
# whoami
# ls

export MAKEFLAGS='-j '$(nproc --all)

mkdir -vp /build

# Install Linux headers
# source /script/build/linux-headers.sh

# Install Man
# source /script/build/man.sh

# Build & install Glibc
# source /script/build/glibc.sh

# Ajust toolchain
# source /script/build/change-toolchain.sh

# Build & Install Zlib
# source /script/build/zlib.sh

# Build & Install File
# source /script/build/file.sh

# Build & Install Readline
# source /script/build/readline.sh

# Build & Install M4
# source /script/build/m4.sh

# Build & Install BC
# source /script/build/bc.sh

# Build & Install BinUtils
# source /script/build/binutils.sh

# Build & Install GMP
# source /script/build/gmp.sh

# Build & Install MPFR
# source /script/build/mpfr.sh

# Build & Install MPC
# source /script/build/mpc.sh

# Build & Install Shadow
# source /script/build/shadow.sh

# Build & Install GCC
# source /script/build/gcc.sh

# Build & Install BZip2
# source /script/build/bzip2.sh

# Build & Install PKG Config
# source /script/build/pkg-config.sh

# Build & Install Ncurses
# source /script/build/ncurses.sh

# Build & Install Attr
# source /script/build/attr.sh

# Build & Install Acl
# source /script/build/acl.sh

# Build & Install LibCap
# source /script/build/libcap.sh

# Build & Install Sed
# source /script/build/sed.sh

# Build & Install Psmisc
# source /script/build/psmisc.sh

# Build & Install Iana-Etc
# source /script/build/iana-etc.sh

# Build & Install Bison
# source /script/build/bison.sh

# Build & Install Flex
# source /script/build/flex.sh

# Build & Install Grep
# source /script/build/grep.sh

# Build & Install Bash
# source /script/build/bash.sh

# Build & Install LibTool
# source /script/build/libtool.sh

# Build & Install GDBM
# source /script/build/gdbm.sh

# Build & Install GPerf
# source /script/build/gperf.sh

# Build & Install Expat
# source /script/build/expat.sh

# Build & Install Expat
# source /script/build/inetutils.sh

# Build & Install Perl
# source /script/build/perl.sh

# Build & Install XML-Parser
# source /script/build/xml-parser.sh

# Build & Install IntlTool
# source /script/build/intltool.sh

# Build & Install AutoConf
# source /script/build/autoconf.sh

# Build & Install AutoMake
# source /script/build/automake.sh

# Build & Install XZ
# source /script/build/xz.sh

# Build & Install Kmod
source /script/build/kmod.sh