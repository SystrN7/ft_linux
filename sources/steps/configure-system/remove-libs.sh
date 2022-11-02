# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    remove-libs.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/02 14:34:24 by felix             #+#    #+#              #
#    Updated: 2022/11/02 14:36:09 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Remove test libs for (binutils, bzip2, e2fsprogs, flex, libtool et zlib)
rm -f /usr/lib/lib{bfd,opcodes}.a
rm -f /usr/lib/libbz2.a
rm -f /usr/lib/lib{com_err,e2p,ext2fs,ss}.a
rm -f /usr/lib/libltdl.a
rm -f /usr/lib/libfl.a
rm -f /usr/lib/libz.a

# Remove ussless libtool archive
find /usr/lib /usr/libexec -name \*.la -delete