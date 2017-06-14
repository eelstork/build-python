#!/bin/sh
# Build Python; for example:
#
# build-python.sh 3.5.2
#
# Available versions: https://www.python.org/downloads/
# Ref:
# https://networkhop.wordpress.com/2016/07/01/install-python-3-5-in-ubuntu-14/
#!/bin/sh
python3 --version
set -ex
if [ $# -eq 1 ]; then
    apt-get update
    apt-get install -y sudo
    sudo apt-get install -y wget build-essential checkinstall
    sudo apt-get install -y libreadline-gplv2-dev \
        libncursesw5-dev libssl-dev libsqlite3-dev tk-dev \
        libgdbm-dev libc6-dev libbz2-dev
    wget https://www.python.org/ftp/python/$1/Python-$1.tgz
    tar -xf Python-$1.tgz
    cd Python-$1
    ./configure
    sudo make install
    python3 --version
else
    echo "Provide a version number (such as 3.5.2) as argument"
fi
