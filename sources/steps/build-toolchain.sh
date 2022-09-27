# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    build-toolchain.sh                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/13 22:19:37 by felix             #+#    #+#              #
#    Updated: 2022/09/27 13:47:51 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# chmod +x ~/.bashrc
for c in $(env | cut -d '=' -f 1); do unset $c; done
source ~/.bashrc

# For debuging
# cat ~/.bashrc
# env

# Move to the lfs scipts path 
cd $LFS_SCRIPT_PATH

# ================================================= #
# Step 4 : Built temporary system.					#
# ================================================= #

# Build binutils (Passe 1)
source ./sources/steps/build-toolchain.sh

# Build GCC