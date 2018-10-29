#!/bin/bash

red() {
    printf "\033[0;31m$*\033[0m\n"
}
yellow() {
    printf "\033[0;33m$*\033[0m\n"
}
fail() {
    red $*
    exit 1
}


if [ $# -lt 1 ]; then
    echo "Usage:"
    echo " $0 <install_directory>"
    echo
    echo "Installs a Miniconda Python 3.7 environment in the given directory"
    exit 1
fi
INSTALL_DIR=$1


cd $INSTALL_DIR || fail "Error: Could not find directory $INSTALL_DIR"

if [ -f miniconda ]; then
    yellow "Directory `pwd`/miniconda already exists- skipping installation"
else
    yellow "Downloading Miniconda install script..."
    curl https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh > Miniconda3-latest-Linux-x86_64.sh

    yellow "Running Miniconda install script..."
    chmod +x Miniconda3-latest-Linux-x86_64.sh
    ./Miniconda3-latest-Linux-x86_64.sh -b -p `pwd`/miniconda
fi

# Hack for Tensorflow 1.12 compatibility
# Install the default Python 3.7, then downgrade to 3.6
miniconda/bin/activate
conda install python=3.6

yellow "Run `pwd`/miniconda/bin/activate to activate this Python installation"
