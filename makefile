# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fgalaup <fgalaup@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/06 10:51:10 by fgalaup           #+#    #+#              #
#    Updated: 2021/02/06 12:10:14 by fgalaup          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Load Linux from scratch Config
include config.env
export $(shell grep -v '^#' config.env | sed 's/=.*//' | xargs -d '\n')

# Load build config (is use to restart build process)
include build/build.env
export $(shell grep -v '^#' build/build.env | sed 's/=.*//' | xargs -d '\n')

.PHONY: all

all: setup
	env | grep LFS

# Step 0 - Setup required software.
setup:
	source test

clean:

	rm -Rf ./build


# dependency