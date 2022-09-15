#!/bin/sh

# Get Dist name
DIS_NAME=$(lsb_release -is)

if [ $DIS_NAME = "Ubuntu" ];
then
	echo "[i] - Installing Ubuntu software requierments."
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
		xz-utils \
		expect \
		kpartx


	sudo rm /bin/sh
	sudo ln -s /bin/bash /bin/sh
fi

# Manjaro

if [ $DIS_NAME = "ManjaroLinux" ];
then
	echo "[!] - Sorry Manjaro is not supported yet."
fi