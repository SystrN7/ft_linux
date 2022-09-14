# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    build-toolchain.sh                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/13 22:19:37 by felix             #+#    #+#              #
#    Updated: 2022/09/14 17:19:54 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# ================================================= #
# Step 3 : Prepare temporary system build.			#
# ================================================= #

# Goto to the ft_linux directory
LFS_REPOSITORY_PATH=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd ../.. && pwd )
export LFS_REPOSITORY_PATH
cd $LFS_REPOSITORY_PATH

# Configure lfs user environement
source ./sources/steps/user-env/setup-lfs-user-env.sh

cat ~/bashrc

exit 0

# ================================================= #
# Step 4 : Built temporary system.					#
# ================================================= #
