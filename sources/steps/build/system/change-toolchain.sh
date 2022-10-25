# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    change-toolchain.sh                                :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/21 22:15:02 by felix             #+#    #+#              #
#    Updated: 2022/10/25 12:06:26 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Use New linker comment in toolchain
mv -v /tools/bin/{ld,ld-old}
mv -v /tools/$(uname -m)-pc-linux-gnu/bin/{ld,ld-old}
mv -v /tools/bin/{ld-new,ld}
ln -sv /tools/bin/ld /tools/$(uname -m)-pc-linux-gnu/bin/ld


# Fix gcc to use the right linker and find the header
gcc -dumpspecs | sed -e 's@/tools@@g'                   \
    -e '/\*startfile_prefix_spec:/{n;s@.*@/usr/lib/ @}' \
    -e '/\*cpp:/{n;s@$@ -isystem /usr/include@}' >      \
    `dirname $(gcc --print-libgcc-file-name)`/specs



# Run somme tests
echo 'int main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose &> dummy.log


cat > expected << "EOF"
# Binary linker
      [Requesting program interpreter: /lib64/ld-linux-x86-64.so.2]
# Starting files
/usr/lib/../lib/crt1.o succeeded
/usr/lib/../lib/crti.o succeeded
/usr/lib/../lib/crtn.o succeeded
# Headers
#include <...> search starts here:
 /usr/include
# Linker search path
SEARCH_DIR("/usr/lib")
SEARCH_DIR("/lib")
# Libs c
attempt to open /lib/libc.so.6 succeeded
# Dynamic linker
found ld-linux-x86-64.so.2 at /lib/ld-linux-x86-64.so.2
EOF

# Check if use the right linker
echo "# Binary linker" > result
readelf -l a.out | grep ': /lib' >> result

# To tcheck use of the right starting files
echo "# Starting files" >> result
grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log >> result

# Check if compiler get the right header files
echo "# Headers" >> result
grep -B1 '^ /usr/include' dummy.log >> result

# Check if the linker use the right search path
echo "# Linker search path" >> result
grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g' | grep -v "linux-gnu" >> result

# Check if using the right lib c
echo "# Libs c" >> result
grep "/lib.*/libc.so.6 " dummy.log >> result

# Check if using the right dynamic linker
echo "# Dynamic linker" >> result
grep found dummy.log >> result

echo "If build stop to this line cause by test failure."
diff result expected

# Remove tests files
rm -v dummy.c a.out dummy.log expected result