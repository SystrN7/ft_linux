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

# Downloading sources files

.sources

if [[ ! -d "./sources/downloads" ]]; then

	echo '[i]-[Download](Sources)...';
	
	wget --input-file=./resources/wget-list --continue --directory-prefix=./sources/downloads/

	# Cheking source archive intergrity
	pushd ./sources/downloads/
		md5sum -c ../resources/md5sums
	popd

fi