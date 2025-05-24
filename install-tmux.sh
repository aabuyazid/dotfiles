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

# Installing LibEvent
git clone https://github.com/libevent/libevent.git
cd libevent
git checkout release-2.1.12-stable
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=${SW_PATH} -DCMAKE_BUILD_TYPE=RelWithDebInfo .. \
    && make && make install
cd $TOP_DIR

# Install NCurses
git clone https://github.com/mirror/ncurses.git
cd ncurses
git checkout v6.4
./configure --prefix=${SW_PATH} && make && make install
cd $TOP_DIR

# Installing Tmux
git clone https://github.com/tmux/tmux.git
cd tmux
git checkout 3.5a
sh autogen.sh
./configure --prefix=${SW_PATH} && make && make install
cd $TOP_DIR
