# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    sysklogd.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/02 10:04:39 by felix             #+#    #+#              #
#    Updated: 2022/11/02 12:08:20 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/sysklogd-1.5.1 /build/sysklogd-1.5.1

pushd /build/sysklogd-1.5.1

# Patch segfault (just bad soft)
sed -i '/Error loading kernel symbols/{n;n;d}' ksym_mod.c
sed -i 's/union wait/int/' syslogd.c

# Build
make

# Install
make BINDIR=/sbin install

# Add default config
cat > /etc/syslog.conf << "EOF"
# Begin /etc/syslog.conf

auth,authpriv.* -/var/log/auth.log
*.*;auth,authpriv.none -/var/log/sys.log
daemon.* -/var/log/daemon.log
kern.* -/var/log/kern.log
mail.* -/var/log/mail.log
user.* -/var/log/user.log
*.emerg *

# End /etc/syslog.conf
EOF

popd

rm -rf /build/sysklogd-1.5.1