# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    configure-devices.sh                               :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/02 15:17:58 by felix             #+#    #+#              #
#    Updated: 2022/11/02 15:49:40 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# # Create default network device naming config
# bash /lib/udev/init-net-rules.sh

# # Print config file (To check if is genreated on HyperV) PS: is dosent work
# cat /etc/udev/rules.d/70-persistent-net.rules

# Create default network insterface configuration
cd /etc/sysconfig/
cat > ifconfig.eth0 << "EOF"
ONBOOT=yes
IFACE=eth0
SERVICE=ipv4-static
IP=192.168.1.2
GATEWAY=192.168.1.1
PREFIX=24
BROADCAST=192.168.1.255
EOF

# Configure DNS
cat > /etc/resolv.conf << "EOF"
# Début de /etc/resolv.conf

domain <Votre nom de domaine>
nameserver 1.1.1.1
nameserver 8.8.8.8

# Fin de /etc/resolv.conf
EOF

# Configure hostname (??? need to change for ft_linux subject)
echo "lfs" > /etc/hostname

# Create host file (??? need to change for ft_linux subject)
# 127.0.1.1 <FQDN> <HOSTNAME>
# <192.168.1.1> <FQDN> <HOSTNAME> [alias1] [alias2 ...]
cat > /etc/hosts << "EOF"
# Begin /etc/hosts

127.0.0.1 localhost
127.0.1.1 lfs.ndaln.com lfs
<192.168.1.1> lfs.ndaln.com lfs
::1       localhost ip6-localhost ip6-loopback
ff02::1   ip6-allnodes
ff02::2   ip6-allrouters

# End /etc/hosts
EOF