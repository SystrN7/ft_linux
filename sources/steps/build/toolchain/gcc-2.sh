# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    gcc-2.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/03 18:14:57 by felix             #+#    #+#              #
#    Updated: 2022/09/29 15:35:36 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy GCC sources.
cp -r --preserve build/lfs/sources/gcc-8.2.0 $LFS_TOOLS_PATH/build/

# Copy GCC dependency sources
cp -r --preserve build/lfs/sources/mpfr-4.0.2 $LFS_TOOLS_PATH/build/gcc-8.2.0/mpfr
cp -r --preserve build/lfs/sources/gmp-6.1.2 $LFS_TOOLS_PATH/build/gcc-8.2.0/gmp
cp -r --preserve build/lfs/sources/mpc-1.1.0 $LFS_TOOLS_PATH/build/gcc-8.2.0/mpc

pushd $LFS_TOOLS_PATH/build/gcc-8.2.0

# Create complete limits c file header
cat gcc/limitx.h gcc/glimits.h gcc/limity.h >  `dirname \
  $($LFS_TGT-gcc -print-libgcc-file-name)`/include-fixed/limits.h

# Fix tools location (linker) required to build GCC
for file in gcc/config/{linux,i386/linux{,64}}.h
do
  cp -uv $file{,.orig}
  sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' \
      -e 's@/usr@/tools@g' $file.orig > $file
  echo '
#undef STANDARD_STARTFILE_PREFIX_1
#undef STANDARD_STARTFILE_PREFIX_2
#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"
#define STANDARD_STARTFILE_PREFIX_2 ""' >> $file
  touch $file.orig
done

# Fix for x86_64
case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
  ;;
esac

# Create build directory
mkdir -v build
cd build

# Create makefile with config
CC=$LFS_TGT-gcc                                    \
CXX=$LFS_TGT-g++                                   \
AR=$LFS_TGT-ar                                     \
RANLIB=$LFS_TGT-ranlib                             \
../configure                                       \
    --prefix=/tools                                \
    --with-local-prefix=/tools                     \
    --with-native-system-header-dir=/tools/include \
    --enable-languages=c,c++                       \
    --disable-libstdcxx-pch                        \
    --disable-multilib                             \
    --disable-bootstrap                            \
    --disable-libgomp

# Build
make

# Install into the tools directory
make install

# Set the default system c compiler to gcc
ln -sv gcc /tools/bin/cc

popd

# Remove temps build dir
rm -rf $LFS_TOOLS_PATH/build/gcc-8.2.0