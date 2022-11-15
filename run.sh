 # Need to chaange in .raw
qemu-system-x86_64 -m 4096 -smp 8 linux_from_scratch.img #\
    # -netdev tap,               \
    # id=hostnet0                \
    # -device e1000,             \
    # netdev=hostnet0,           \
    # macaddr=00:16:35:AF:94:4B, \
    # name=ncard1