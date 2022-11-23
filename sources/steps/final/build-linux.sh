# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    build-linux.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/03 11:39:18 by felix             #+#    #+#              #
#    Updated: 2022/11/23 15:28:05 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy linux kernel sources.
cp -r --preserve /sources/linux-4.20.12 /build/linux-4.20.12

pushd /build/linux-4.20.12

# Clean up the linux sources
make mrproper

if false ; then
    # If you want do manual config
    # Generated default (with system optimisation)
    make defconfig

    # Configure config files with UI (CLI)
    make menuconfig

    echo "--------------------------------------------"
    cat .config
    echo "--------------------------------------------"
else
    cp /script/.config .
fi

# Build
make

# Intstall module
make modules_install

# Install linux kernel
# Move kernel binary to the boot fs
# ??? Require change for lfs subject
cp -iv arch/x86/boot/bzImage /boot/vmlinuz-4.20.12-$LFS_KERNEL_BINARY_CODENAME

# Add kernel debug symbole
cp -iv System.map /boot/System.map-4.20.12

# Backup kernel config files
cp -iv .config /boot/config-4.20.12

# Install docs
install -d /usr/share/doc/linux-4.20.12
cp -r Documentation/* /usr/share/doc/linux-4.20.12

# Configure module loading to fix some issue
install -v -m755 -d /etc/modprobe.d
cat > /etc/modprobe.d/usb.conf << "EOF"
# Begin /etc/modprobe.d/usb.conf

install ohci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i ohci_hcd ; true
install uhci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i uhci_hcd ; true

# End /etc/modprobe.d/usb.conf
EOF

popd

# Not remove is for ft_linux subject complience
mv /build/linux-4.20.12 /usr/src
