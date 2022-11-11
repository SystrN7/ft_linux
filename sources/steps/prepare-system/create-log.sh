# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    create-log.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/18 12:30:04 by felix             #+#    #+#              #
#    Updated: 2022/10/21 15:15:33 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Create system logs files (for user authentification)
touch /var/log/{btmp,lastlog,faillog,wtmp}
chgrp -v utmp /var/log/lastlog
chmod -v 664  /var/log/lastlog
chmod -v 600  /var/log/btmp