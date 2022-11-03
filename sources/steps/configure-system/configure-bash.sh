# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    configure-bash.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/03 10:14:59 by felix             #+#    #+#              #
#    Updated: 2022/11/03 10:32:19 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

echo "List all locals available on the system."
locale -a

echo "Show info of canonic name of chosen local"
export LC_ALL=fr_FR.iso88591

locale language
locale charmap
locale int_curr_symbol
locale int_prefix

unset LC_ALL

# Create default sub bash configuration
cat > /etc/profile << "EOF"
# Début de /etc/profile

export LANG=fr_FR.ISO-8859-1@euro

# Fin de /etc/profile
EOF