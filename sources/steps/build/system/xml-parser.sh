# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    xml-parser.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/27 14:05:58 by felix             #+#    #+#              #
#    Updated: 2022/10/27 15:06:13 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/XML-Parser-2.44 /build/XML-Parser-2.44

pushd /build/XML-Parser-2.44

# Create makefile with config
perl Makefile.PL

# Build
make

# Run test
make test

# Install
make install

popd

rm -rf /build/XML-Parser-2.44
