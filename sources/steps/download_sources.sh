# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    download_sources.sh                                :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fgalaup <fgalaup@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/06 12:27:21 by fgalaup           #+#    #+#              #
#    Updated: 2021/02/06 13:36:22 by fgalaup          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Downloading source file
wget --input-file=./resources/wget-list --continue --directory-prefix=./download/

# Cheking source archive validity
pushd ./download/
md5sum -c ../resources/md5sums
popd