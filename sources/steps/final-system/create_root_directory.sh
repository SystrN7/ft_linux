# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    create_root_directory.sh                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/18 11:15:22 by felix             #+#    #+#              #
#    Updated: 2022/10/18 15:30:27 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Create directory for binarys, libs, config, docs, ...
mkdir -pv /{bin,boot,etc/{opt,sysconfig},home,lib/firmware,mnt,opt}
mkdir -pv /{media/{floppy,cdrom},sbin,srv,var}
install -dv -m 0750 /root
install -dv -m 1777 /tmp /var/tmp
mkdir -pv /usr/{,local/}{bin,include,lib,sbin,src,game}
mkdir -pv /usr/{,local/}share/{color,dict,doc,info,locale,man,game}
mkdir -v  /usr/{,local/}share/{misc,terminfo,zoneinfo}
mkdir -v  /usr/libexec
mkdir -pv /usr/{,local/}share/man/man{1..8}

# If system is librays is 64bits create directory
case $(uname -m) in
 x86_64) mkdir -v /lib64 ;;
esac

mkdir -v /var/{log,mail,spool}
ln -sv /run /var/run
ln -sv /run/lock /var/lock
mkdir -pv /var/{opt,cache,lib/{color,misc,locate},local}