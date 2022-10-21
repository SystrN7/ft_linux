# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    create_symbolic_link.sh                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/18 11:33:46 by felix             #+#    #+#              #
#    Updated: 2022/10/18 16:40:31 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Links required binarys
ln -sv /tools/bin/{bash,cat,chmod,dd,echo,ln,mkdir,pwd,rm,stty,touch} /bin
ln -sv /tools/bin/{env,install,perl,printf}         /usr/bin
ln -sv /tools/lib/libgcc_s.so{,.1}                  /usr/lib
ln -sv /tools/lib/libstdc++.{a,so{,.6}}             /usr/lib

install -vdm755 /usr/lib/pkgconfig

ln -sv bash /bin/sh

ln -sv /proc/self/mounts /etc/mtab