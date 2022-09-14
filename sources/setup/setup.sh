# Get operating system name
OS=$(uname);

# Install linux dependency
if [ "${OS}" = "Linux" ]; then
	source ./sources/setup/linux.sh
	exit
fi

# Install macos dependency
if [ "${OS}" = "Darwin" ]; then
	echo "[x]-Sorry but this operating system is not supported."
	exit 1
fi