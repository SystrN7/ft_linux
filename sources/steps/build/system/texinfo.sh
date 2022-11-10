# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    textinfo.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/02 10:04:09 by felix             #+#    #+#              #
#    Updated: 2022/11/10 11:36:07 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/texinfo-6.5 /build/texinfo-6.5

pushd /build/texinfo-6.5

# Fix file create lot of error durring test
sed -i '5481,5485 s/({/(\\{/' tp/Texinfo/Parser.pm

# Create makefile with config
./configure --prefix=/usr --disable-static

# Build
make

if [[ "$LFS_TEST_RUN" == "true" ]]; then 
    # Run test
    make check
fi

# Install
make install
# Intall Tex component
make TEXMF=/usr/share/texmf install-tex

# Fix doc install for other broken makefile
pushd /usr/share/info
rm -v dir
for f in *
  do install-info $f dir 2>/dev/null
done
popd

popd

rm -rf /build/texinfo-6.5