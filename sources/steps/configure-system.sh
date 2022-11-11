# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    configure-system.sh                                :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/02 14:33:31 by felix             #+#    #+#              #
#    Updated: 2022/11/11 17:43:54 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Make build multi-threaded
export MAKEFLAGS='-j '$(nproc --all)

# Debug
# whoami
# ls
# env

# Remove some useless libs (debug and other)
source /script/remove-libs.sh

# Install init tool (SysV)
source /script/install-bootscripts.sh

# Configure devices
source /script/configure-devices.sh

# Configure SystemV (init)
source /script/configure-init.sh

# Configure Bash
source /script/configure-bash.sh

# Configure Readline
source /script/configure-readline.sh

# Configure Shell
source /script/configure-shell.sh

# Configure File System loading
source /script/configure-file-system-load.sh

# Configure system info file
source /script/configure-system-info.sh