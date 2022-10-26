# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    shadow.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/26 17:07:45 by felix             #+#    #+#              #
#    Updated: 2022/10/26 17:36:53 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/shadow-4.6 /build/shadow-4.6

pushd /build/shadow-4.6

# Prevent install of already install docs/man and group utils
sed -i 's/groups$(EXEEXT) //' src/Makefile.in
find man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {} \;
find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \;
find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {} \;

# Fix security issue (hashing methode) + deprecated mail path
sed -i -e 's@#ENCRYPT_METHOD DES@ENCRYPT_METHOD SHA512@' \
       -e 's@/var/spool/mail@/var/mail@' etc/login.defs

# Config user id start number to 1000
sed -i 's/1000/999/' etc/useradd

# Create makefile with config
./configure --sysconfdir=/etc --with-group-name-max-length=32

# Build
make

# Install
make install

# Fix wrong binary path
mv -v /usr/bin/passwd /bin

# Enable password shadowing
pwconv

# Enable groups password shadowing
grpconv

# Disable mail box creation
sed -i 's/yes/no/' /etc/default/useradd

# Change root password (??? lockup to disable to prevent script block)
echo "Type user root password :"
passwd root

popd

rm -rf /build/shadow-4.6