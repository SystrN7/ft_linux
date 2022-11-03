# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    configure-shell.sh                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/03 10:42:11 by felix             #+#    #+#              #
#    Updated: 2022/11/03 10:42:36 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# List of available shell on the system
cat > /etc/shells << "EOF"
# Begin /etc/shells

/bin/sh
/bin/bash

# End /etc/shells
EOF