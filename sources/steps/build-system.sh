# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    build-system.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/18 10:34:18 by felix             #+#    #+#              #
#    Updated: 2022/11/11 18:12:57 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Debug
# whoami
# ls

export MAKEFLAGS='-j '$(nproc --all)

mkdir -vp /build

# Install Linux headers
source /script/build/linux-headers.sh

# Install Man
source /script/build/man.sh

# Build & install Glibc
source /script/build/glibc.sh

# Ajust toolchain
source /script/build/change-toolchain.sh

# Build & Install Zlib
source /script/build/zlib.sh

# Build & Install File
source /script/build/file.sh

# Build & Install Readline
source /script/build/readline.sh

# Build & Install M4
source /script/build/m4.sh

# Build & Install BC
source /script/build/bc.sh

# Build & Install BinUtils
source /script/build/binutils.sh

# Build & Install GMP
source /script/build/gmp.sh

# Build & Install MPFR
source /script/build/mpfr.sh

# Build & Install MPC
source /script/build/mpc.sh

# Build & Install Shadow
source /script/build/shadow.sh

# Build & Install GCC
source /script/build/gcc.sh

# Build & Install BZip2
source /script/build/bzip2.sh

# Build & Install PKG Config
source /script/build/pkg-config.sh

# Build & Install Ncurses
source /script/build/ncurses.sh

# Build & Install Attr
source /script/build/attr.sh

# Build & Install Acl
source /script/build/acl.sh

# Build & Install LibCap
source /script/build/libcap.sh

# Build & Install Sed
source /script/build/sed.sh

# Build & Install Psmisc
source /script/build/psmisc.sh

# Build & Install Iana-Etc
source /script/build/iana-etc.sh

# Build & Install Bison
source /script/build/bison.sh

# Build & Install Flex
source /script/build/flex.sh

# Build & Install Grep
source /script/build/grep.sh

# Build & Install Bash
source /script/build/bash.sh

# Build & Install LibTool
source /script/build/libtool.sh

# Build & Install GDBM
source /script/build/gdbm.sh

# Build & Install GPerf
source /script/build/gperf.sh

# Build & Install Expat
source /script/build/expat.sh

# Build & Install Expat
source /script/build/inetutils.sh

# Build & Install Perl
source /script/build/perl.sh

# Build & Install XML-Parser
source /script/build/xml-parser.sh

# Build & Install IntlTool
source /script/build/intltool.sh

# Build & Install AutoConf
source /script/build/autoconf.sh

# Build & Install AutoMake
source /script/build/automake.sh

# Build & Install XZ
source /script/build/xz.sh

# Build & Install Kmod
source /script/build/kmod.sh

# Build & Install GetText
source /script/build/gettext.sh

# Build & Install ELFUtils
source /script/build/libelf.sh

# Build & Install Libffi
source /script/build/libffi.sh

# Build & Install OpenSSL
source /script/build/openssl.sh

# Build & Install Python
source /script/build/python.sh

# Build & Install Ninja
source /script/build/ninja.sh

# Build & Install Meson
source /script/build/meson.sh

# Build & Install CoreUtils
source /script/build/coreutils.sh

# Build & Install Check
source /script/build/check.sh

# Build & Install DiffUtils
source /script/build/diffutils.sh

# Build & Install Gawk
source /script/build/gawk.sh

# Build & Install FindUtils
source /script/build/findutils.sh

# Build & Install Groff
source /script/build/groff.sh

# Build & Install Grub
source /script/build/grub.sh

# Build & Install Less
source /script/build/less.sh

# Build & Install Gzip
source /script/build/gzip.sh

# Build & Install IpRoute2
source /script/build/iproute2.sh

# Build & Install Kdb
source /script/build/kdb.sh

# Build & Install LibPipeline
source /script/build/libpipeline.sh

# Build & Install Make
source /script/build/make.sh

# Build & Install Patch
source /script/build/patch.sh

# Build & Install ManDb
source /script/build/man-db.sh

# Build & Install Tar
source /script/build/tar.sh

# Build & Install TextInfo
source /script/build/texinfo.sh

# Build & Install Vim
source /script/build/vim.sh

# Build CURL
source /script/build/curl.sh

# Build & Install ProcPs
source /script/build/procps.sh

# Build & Install UtilLinux
source /script/build/util-linux.sh

# Build & Install E2fsprogs
source /script/build/e2fsprogs.sh

# Build & Install SysKLogD
source /script/build/sysklogd.sh

# Build & Install SysVInit
source /script/build/sysvinit.sh

# Build & Install Eudev
source /script/build/eudev.sh


# ================================================= #
#  Clean useless files of build              		#
# ================================================= #

# Backup required debugable lib for future test of BLFS
save_lib="ld-2.29.so libc-2.29.so libpthread-2.29.so libthread_db-1.0.so"

cd /lib

for LIB in $save_lib; do
    objcopy --only-keep-debug $LIB $LIB.dbg 
    strip --strip-unneeded $LIB
    objcopy --add-gnu-debuglink=$LIB.dbg $LIB 
done    

save_usrlib="libquadmath.so.0.0.0 libstdc++.so.6.0.25
             libitm.so.1.0.0 libatomic.so.1.2.0" 

cd /usr/lib

for LIB in $save_usrlib; do
    objcopy --only-keep-debug $LIB $LIB.dbg
    strip --strip-unneeded $LIB
    objcopy --add-gnu-debuglink=$LIB.dbg $LIB
done

unset LIB save_lib save_usrlib

echo "Libs backup"

# Remove Debug symbole
/tools/bin/find /usr/lib -type f -name \*.a \
   -exec /tools/bin/strip --strip-debug {} ';'  || true

/tools/bin/find /lib /usr/lib -type f \( -name \*.so* -a ! -name \*dbg \) \
   -exec /tools/bin/strip --strip-unneeded {} ';'  || true

/tools/bin/find /{bin,sbin} /usr/{bin,sbin,libexec} -type f \
    -exec /tools/bin/strip --strip-all {} ';' || true

echo "Clean debug symbole"

# Remove file generated durring build
rm -rf /tmp/*

# Exit chroot
logout
