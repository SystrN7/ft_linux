# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    gcc.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/26 18:56:53 by felix             #+#    #+#              #
#    Updated: 2022/10/26 20:20:02 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/gcc-8.2.0 /build/gcc-8.2.0

pushd /build/gcc-8.2.0

# Fix for x64 system
case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
  ;;
esac

# Remove toolchain gcc from system
rm -f /usr/lib/gcc

# Create build directory
mkdir -v build
cd       build

# Create makefile with config
SED=sed                               \
../configure --prefix=/usr            \
             --enable-languages=c,c++ \
             --disable-multilib       \
             --disable-bootstrap      \
             --disable-libmpx         \
             --with-system-zlib

# Build
make

# Fix test environement (incress stack size)
ulimit -s 32768

# Remove bad test
rm ../gcc/testsuite/g++.dg/pr83239.C

# Run test
chown -Rv nobody . 
su nobody -s /bin/bash -c "PATH=$PATH make -k check || echo $?"

# show test result
../contrib/test_summary

# Install
make install

# Create link for FHS compilence
ln -sv ../usr/bin/cpp /lib

# Create default compiler link 
ln -sv gcc /usr/bin/cc

# Install LTO (link time optimizer)
install -v -dm755 /usr/lib/bfd-plugins
ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/8.2.0/liblto_plugin.so \
        /usr/lib/bfd-plugins/

popd

rm -rf /build/gcc-8.2.0

######## TEST ########
cat > expected << "EOF"
# Binary linker
      [Requesting program interpreter: /lib64/ld-linux-x86-64.so.2]
# Starting files
/usr/lib/gcc/x86_64-pc-linux-gnu/8.2.0/../../../../lib/crt1.o succeeded
/usr/lib/gcc/x86_64-pc-linux-gnu/8.2.0/../../../../lib/crti.o succeeded
/usr/lib/gcc/x86_64-pc-linux-gnu/8.2.0/../../../../lib/crtn.o succeeded
# Headers
#include <...> search starts here:
 /usr/lib/gcc/x86_64-pc-linux-gnu/8.2.0/include
 /usr/local/include
 /usr/lib/gcc/x86_64-pc-linux-gnu/8.2.0/include-fixed
 /usr/include
# Linker search path
SEARCH_DIR("/usr/x86_64-pc-linux-gnu/lib64")
SEARCH_DIR("/usr/local/lib64")
SEARCH_DIR("/lib64")
SEARCH_DIR("/usr/lib64")
SEARCH_DIR("/usr/x86_64-pc-linux-gnu/lib")
SEARCH_DIR("/usr/local/lib")
SEARCH_DIR("/lib")
SEARCH_DIR("/usr/lib");
# Libs c
attempt to open /lib/libc.so.6 succeeded
# Dynamic linker
found ld-linux-x86-64.so.2 at /lib/ld-linux-x86-64.so.2
EOF

# ??? to support the 32bits cpu
# SEARCH_DIR("/usr/i686-pc-linux-gnu/lib32")
# SEARCH_DIR("/usr/local/lib32")
# SEARCH_DIR("/lib32")
# SEARCH_DIR("/usr/lib32")
# SEARCH_DIR("/usr/i686-pc-linux-gnu/lib")
# SEARCH_DIR("/usr/local/lib")
# SEARCH_DIR("/lib")
# SEARCH_DIR("/usr/lib");

echo 'int main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose &> dummy.log

# Check if use the right linker
echo "# Binary linker" > result
readelf -l a.out | grep ': /lib' >> result

# To tcheck use of the right starting files
echo "# Starting files" >> result
grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log >> result

# Check if compiler get the right header files
echo "# Headers" >> result
grep -B4 '^ /usr/include' dummy.log >> result

# Check if the linker use the right search path
echo "# Linker search path" >> result
grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g' >> result

# Check if using the right lib c
echo "# Libs c" >> result
grep "/lib.*/libc.so.6 " dummy.log >> result

# Check if using the right dynamic linker
echo "# Dynamic linker" >> result
grep found dummy.log >> result

echo "If build stop to this line cause by test failure."
diff result expected

# Remove tests files
rm -v dummy.c a.out dummy.log expected result

# Fix wrong files location
mkdir -pv /usr/share/gdb/auto-load/usr/lib
mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib