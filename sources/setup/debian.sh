sudo apt install -y \
    build-essential \
    wget \
    bash \
    binutils \
    bison \
    bzip2 \
    coreutils \
    diffutils \
    findutils \
    gawk \
    gcc \
    grep \
    gzip \
    m4 \
    make \
    patch \
    perl \
    python3 \
    sed \
    tar \
    texinfo \
    xz-utils


sudo rm /bin/sh
sudo ln -s /usr/bin/bash /bin/sh