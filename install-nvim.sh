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

# Installing Neovim
git clone https://github.com/neovim/neovim.git
cd neovim
git fetch --tags
git checkout tags/v0.11.1
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=${SW_PATH}
make install
cd $TEMP_DIR

# Download Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# nvim +PlugInstall +PluginInstall +PackerInstall

cd $TOP_DIR && rm -rf $TEMP_DIR
clear && echo Neovim installation complete!
