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

# Installing LuaJIT
git clone https://luajit.org/git/luajit.git
cd luajit
git checkout v2.1
make CMAKE_BUILD_TYPE=RelWithDebInfo PREFIX=${SW_PATH}
make install PREFIX=${SW_PATH}
cd $TOP_DIR

# Installing Neovim
git clone git@github.com:neovim/neovim.git
cd neovim
git fetch --tags
git checkout tags/v0.11.1
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=${SW_PATH}
make install
cd $TOP_DIR

# Download Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

nvim +PlugInstall +PluginInstall +PackerInstall
