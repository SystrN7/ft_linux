# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    vim.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/02 10:04:19 by felix             #+#    #+#              #
#    Updated: 2022/11/02 11:30:28 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve /sources/vim81 /build/vim81

pushd /build/vim81

# Change Location of default config file
echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h

# Create makefile with config
./configure --prefix=/usr

# Build
make

# Run test
LANG=en_US.UTF-8 make -j1 test &> vim-test.log

# Install
make install

# Create shortcut vi
ln -sv vim /usr/bin/vi
for L in  /usr/share/man/{,*/}man1/vim.1; do
    ln -sv vim.1 $(dirname $L)/vi.1
done

# Fix document location to be like the other program
ln -sv ../vim/vim81/doc /usr/share/doc/vim-8.1

# Create default vim configure
cat > /etc/vimrc << "EOF"
" Begin /etc/vimrc

" Ensure defaults are set before customizing settings, not after
source $VIMRUNTIME/defaults.vim
let skip_defaults_vim=1 

set nocompatible
set backspace=2
set mouse=
syntax on
if (&term == "xterm") || (&term == "putty")
  set background=dark
endif

" End /etc/vimrc
EOF

popd

rm -rf /build/vim81