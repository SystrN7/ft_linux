# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/06 10:51:10 by fgalaup           #+#    #+#              #
#    Updated: 2022/03/28 12:12:41 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Load Linux from scratch Config
include config.env
export $(shell grep -v '^#' config.env | sed 's/=.*//' | xargs -d '\n')

# Load build config (is use to restart build process)
include build/build.env
export $(shell grep -v '^#' build/build.env | sed 's/=.*//' | xargs -d '\n')

.PHONY: all

# Start building scripts
all:
	bash ./build-lfs.sh

# Install dependency to build LFS
setup:
	bash ./sources/setup.sh

# Mount virtual disk and folder in build directory
mount:
	bash -c 'source ./sources/steps/disk/mount-disk.sh ; source ./sources/steps/disk/mount-fs.sh'

# UnMount virtual disk and folder in build directory
unount:
	bash ./sources/steps/disk/unmount.sh

# Remove buildfile
clean: unmount
	rm -Rf ./build