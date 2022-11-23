# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    openssh.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/23 22:57:36 by felix             #+#    #+#              #
#    Updated: 2022/11/23 23:31:12 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/openssh-7.9p1 /build/openssh-7.9p1

pushd /build/openssh-7.9p1

# Prepare system (init deamon and create user and groups)
install  -v -m700 -d /var/lib/sshd &&
chown    -v root:sys /var/lib/sshd &&

groupadd -g 50 sshd        &&
useradd  -c 'sshd PrivSep' \
         -d /var/lib/sshd  \
         -g sshd           \
         -s /bin/false     \
         -u 50 sshd

# Patch code for security
patch -Np1 -i /sources/patchs/openssh-7.9p1-security_fix-1.patch

# Create makefile with config
./configure --prefix=/usr                     \
            --sysconfdir=/etc/ssh             \
            --with-md5-passwords              \
            --with-privsep-path=/var/lib/sshd
# Build
make

if [[ "$LFS_TEST_RUN" == "true" ]]; then 
    # Run test
    # Need to copy scp program into binary
    # make test
fi

# Install
make install
install -v -m755    contrib/ssh-copy-id /usr/bin

install -v -m644    contrib/ssh-copy-id.1 \
                    /usr/share/man/man1
install -v -m755 -d /usr/share/doc/openssh-7.9p1
install -v -m644    INSTALL LICENCE OVERVIEW README* \
                    /usr/share/doc/openssh-7.9p1

# Install Deamon
make install-sshd

popd

rm -rf /build/openssh-7.9p1