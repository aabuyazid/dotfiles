#!/bin/bash

SW_PATH=${HOME}/sw
TOP_DIR=$(pwd)

if [[ ! -d ${SW_PATH} ]]; then
    echo Creating ${SW_PATH}
    mkdir -p ${SW_PATH}/bin
fi

if [[ "${PATH}" != *"${SW_PATH}/bin"* ]]; then
    echo Appending ${SW_PATH} to PATH
    export PATH="${SW_PATH}/bin:$PATH"
fi

if [[ $(uname) == "Darwin" ]]; then
    export MACOSX_DEPLOYMENT_TARGET=14.1.1
fi

# Creating directory that will be deleted later
mkdir temp && cd temp
TEMP_DIR=$(pwd)

# Installing GNU Texinfo
curl -O https://ftp.gnu.org/gnu/texinfo/texinfo-7.1.tar.gz
tar -xzf texinfo-7.1.tar.gz
cd texinfo-7.1
./configure --prefix=${SW_PATH} && make && make install
cd $TEMP_DIR

# Installing GNU Automake
git clone https://github.com/autotools-mirror/automake.git
cd automake
git checkout v1.17
./configure --prefix=${SW_PATH} && make && make install
cd $TEMP_DIR

# Installing pkg-config
curl -LO https://pkg-config.freedesktop.org/releases/pkg-config-0.29.2.tar.gz
tar -xzf pkg-config-0.29.2.tar.gz
cd pkg-config-0.29.2
./configure --prefix=${SW_PATH} && make && make install
cd $TEMP_DIR

# Installing LibEvent
git clone https://github.com/libevent/libevent.git
cd libevent
git checkout release-2.1.12-stable
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=${SW_PATH} -DCMAKE_BUILD_TYPE=RelWithDebInfo .. \
    && make && make install
cd $TEMP_DIR

# Install NCurses
git clone https://github.com/mirror/ncurses.git
cd ncurses
git checkout v6.4
./configure --prefix=${SW_PATH} --enable-utf8proc && make && make install
cd $TEMP_DIR

# Installing Tmux
git clone https://github.com/tmux/tmux.git
cd tmux
git checkout 3.5a
sh autogen.sh
./configure --prefix=${SW_PATH} && make && make install
cd $TEMP_DIR

cd $TOP_DIR && rm -rf $TEMP_DIR

clear && echo Tmux installation complete!
