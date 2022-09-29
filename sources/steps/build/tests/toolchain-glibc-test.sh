# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    toolchain-glibc-test.sh                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/29 11:30:36 by felix             #+#    #+#              #
#    Updated: 2022/09/29 14:31:45 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

pushd ~

echo 'int main(){}' > dummy.c
$LFS_TGT-gcc dummy.c
TO_TEST=$(readelf -l a.out | grep ': /tools')

rm -f dummy.c a.out

if [[ "$(uname -m)" = "x86_64" ]]; then
    EXPECTED="      [Requesting program interpreter: /tools/lib64/ld-linux-x86-64.so.2]"
elif [[ "$(uname -m)" = "x86" ]]; then
    EXPECTED="      [Requesting program interpreter: /tools/lib/ld-linux.so.2]"
else
    echo "[x]- CPU arch not supported: "$(uname -m)
    exit 1
fi
    

if [[ "$EXPECTED" != "$TO_TEST" ]]; then
    
    echo "[x]-An error occurs durring the build of primary element of the toolchain"
    exit 1;
fi

popd
