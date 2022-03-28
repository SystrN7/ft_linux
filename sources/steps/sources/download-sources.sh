# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    download-sources.sh                                :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/06 12:27:21 by fgalaup           #+#    #+#              #
#    Updated: 2022/03/27 19:28:22 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Downloading sources files

if [[ ! -d "./sources/downloads" ]]; then

	echo '[i]-[Download](Sources)...';
	
	wget --input-file=./resources/wget-list --continue --directory-prefix=./sources/downloads/

	# Cheking source archive intergrity
	pushd ./sources/downloads/
		md5sum -c ../resources/md5sums
	popd

fi