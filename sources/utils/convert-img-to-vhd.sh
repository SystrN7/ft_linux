# 'C:/Program Files/Oracle/VirtualBox/VBoxManage.exe' convertfromraw linux_from_scratch.raw ft_linux.vhd --format VHD
VBoxManage convertfromraw linux_from_scratch.raw ft_linux.vhd --format VHD # With virtual box 
qemu-img convert -f raw -O vpc build/linux_from_scratch.img  ft_linux.vhd # With qemu