# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    xml-parser.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:05:58 by felix             #+#    #+#              #
#    Updated: 2022/11/10 11:02:00 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/XML-Parser-2.44 /build/XML-Parser-2.44

pushd /build/XML-Parser-2.44

# Create makefile with config
perl Makefile.PL

# Build
make

if [[ "$LFS_TEST_RUN" == "true" ]]; then 
    # Run test
    make check
fi

# Install
make install

popd

rm -rf /build/XML-Parser-2.44
