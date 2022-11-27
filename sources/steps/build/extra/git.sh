# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    git.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/23 21:36:51 by felix             #+#    #+#              #
#    Updated: 2022/11/27 22:14:50 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/git-2.20.1 /build/git-2.20.1

pushd /build/git-2.20.1

# Create makefile with config
./configure --prefix=/usr \
    --with-gitconfig=/etc/gitconfig

# Build
make

if [[ "$LFS_TEST_RUN" == "true" ]]; then 
    # Run test
    make test
fi

# Install man pages
tar -xf /sources/git-manpages-2.20.1.tar.xz \
    -C /usr/share/man --no-same-owner --no-overwrite-dir

# Install HTML docs
mkdir -vp   /usr/share/doc/git-2.20.1 &&
tar   -xf   /sources/git-htmldocs-2.20.1.tar.xz \
      -C    /usr/share/doc/git-2.20.1 --no-same-owner --no-overwrite-dir &&

find        /usr/share/doc/git-2.20.1 -type d -exec chmod 755 {} \; &&
find        /usr/share/doc/git-2.20.1 -type f -exec chmod 644 {} \;

# Fix docs location
mkdir -vp /usr/share/doc/git-2.20.1/man-pages/{html,text}         &&
mv        /usr/share/doc/git-2.20.1/{git*.txt,man-pages/text}     &&
mv        /usr/share/doc/git-2.20.1/{git*.,index.,man-pages/}html &&

mkdir -vp /usr/share/doc/git-2.20.1/technical/{html,text}         &&
mv        /usr/share/doc/git-2.20.1/technical/{*.txt,text}        &&
mv        /usr/share/doc/git-2.20.1/technical/{*.,}html           &&

mkdir -vp /usr/share/doc/git-2.20.1/howto/{html,text}             &&
mv        /usr/share/doc/git-2.20.1/howto/{*.txt,text}            &&
mv        /usr/share/doc/git-2.20.1/howto/{*.,}html               &&

sed -i '/^<a href=/s|howto/|&html/|' /usr/share/doc/git-2.20.1/howto-index.html &&
sed -i '/^\* link:/s|howto/|&html/|' /usr/share/doc/git-2.20.1/howto-index.txt

popd

rm -rf /build/git-2.20.1