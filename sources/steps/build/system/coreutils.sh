# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    coreutils.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:07:49 by felix             #+#    #+#              #
#    Updated: 2022/10/27 18:45:46 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/coreutils-8.30 /build/coreutils-8.30

pushd /build/coreutils-8.30

# Patch for POSIX multibyte encoding work and internationalisation fixies
patch -Np1 -i /sources/patchs/coreutils-8.30-i18n-1.patch

# Remove buggy test (infinit loop)
sed -i '/test.lock/s/^/#/' gnulib-tests/gnulib.mk

# Create makefile with config
autoreconf -fiv
FORCE_UNSAFE_CONFIGURE=1 ./configure \
            --prefix=/usr            \
            --enable-no-install-program=kill,uptime

# Build
FORCE_UNSAFE_CONFIGURE=1 make

# Run test
make NON_ROOT_USERNAME=nobody check-root

# Add uset to temps groups to runing test
echo "dummy:x:1000:nobody" >> /etc/group
chown -Rv nobody . 

su nobody -s /bin/bash \
          -c "PATH=$PATH make RUN_EXPENSIVE_TESTS=yes check" \
          || echo "Test faild : $?"
# Remove temps groups
sed -i '/dummy/d' /etc/group

# Install
make install
# Fix binary location for FHS complience
mv -v /usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} /bin
mv -v /usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,rm} /bin
mv -v /usr/bin/{rmdir,stty,sync,true,uname} /bin
mv -v /usr/bin/chroot /usr/sbin
mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
sed -i s/\"1\"/\"8\"/1 /usr/share/man/man8/chroot.8
# Fix location for boot phase
mv -v /usr/bin/{head,nice,sleep,touch} /bin

popd

rm -rf /build/coreutils-8.30
