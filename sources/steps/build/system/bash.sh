# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    bash.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 09:59:29 by felix             #+#    #+#              #
#    Updated: 2022/11/10 11:04:15 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/bash-5.0 /build/bash-5.0

pushd /build/bash-5.0

# Create makefile with config
./configure --prefix=/usr                    \
            --docdir=/usr/share/doc/bash-5.0 \
            --without-bash-malloc            \
            --with-installed-readline

# Build
make

# Allow nobody to write into the source folder
chown -Rv nobody .

if [[ "$LFS_TEST_RUN" == "true" ]]; then 
    # Run test
    su nobody -s /bin/bash -c "PATH=$PATH HOME=/home make tests"
fi

# Install
make install
mv -vf /usr/bin/bash /bin

popd

rm -rf /build/bash-5.0