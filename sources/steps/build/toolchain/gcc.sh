# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    gcc.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/03 18:14:57 by felix             #+#    #+#              #
#    Updated: 2022/09/29 10:10:42 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy GCC sources.
cp -r --preserve build/lfs/sources/gcc-8.2.0 $LFS_TOOLS_PATH/build/

# Copy GCC dependency sources
cp -r --preserve build/lfs/sources/mpfr-4.0.2 $LFS_TOOLS_PATH/build/gcc-8.2.0/mpfr
cp -r --preserve build/lfs/sources/gmp-6.1.2 $LFS_TOOLS_PATH/build/gcc-8.2.0/gmp
cp -r --preserve build/lfs/sources/mpc-1.1.0 $LFS_TOOLS_PATH/build/gcc-8.2.0/mpc

pushd $LFS_TOOLS_PATH/build/gcc-8.2.0

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

case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
 ;;
esac

mkdir -v build
cd build

# Create makefile with config
../configure                                       \
    --target=$LFS_TGT                              \
    --prefix=/tools                                \
    --with-glibc-version=2.11                      \
    --with-sysroot=$LFS_PATH                       \
    --with-newlib                                  \
    --without-headers                              \
    --with-local-prefix=/tools                     \
    --with-native-system-header-dir=/tools/include \
    --disable-nls                                  \
    --disable-shared                               \
    --disable-multilib                             \
    --disable-decimal-float                        \
    --disable-threads                              \
    --disable-libatomic                            \
    --disable-libgomp                              \
    --disable-libmpx                               \
    --disable-libquadmath                          \
    --disable-libssp                               \
    --disable-libvtv                               \
    --disable-libstdcxx                            \
    --enable-languages=c,c++

# Build
make

# Install into the tools directory
make install

popd

# Remove temps build dir
rm -rf $LFS_TOOLS_PATH/build/gcc-8.2.0