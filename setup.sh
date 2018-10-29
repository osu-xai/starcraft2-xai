#!/bin/bash

confirm() {
    # call with a prompt string or use a default
    echo
    read -r -p "${1:-Do you wish to continue? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY])
            true
            ;;
        *)
            false
            ;;
    esac
}

yellow() {
    printf "\033[0;33m$*\033[0m\n"
}


GIT_URL=https://github.com/lwneal/starcraft-rl
HOME_ROOT=/scratch/eecs-share
SOURCE_DIR=/scratch/eecs-share/sc2

INSTALL_DIR=$HOME_ROOT/$(whoami)

yellow "Preparing to install a StarCraftII development environment at $INSTALL_DIR"
confirm || exit

# Create a user directory eg. /scratch/eecs-share/doejohn
mkdir -p $INSTALL_DIR
cd $INSTALL_DIR


# Install and source a Miniconda Python 3 environment
$SOURCE_DIR/install_miniconda.sh $INSTALL_DIR
. miniconda/bin/activate
PYTHON_VERSION=$(python --version)
PYTHON_WHERE=$(which python)


# Install StarCraftII
git clone $GIT_URL || echo "starcraft-rl is already installed..."
cd starcraft-rl
git pull $GIT_URL
SC2_CACHE=$SOURCE_DIR ./install_starcraft2.sh
SC2_VERSION=$(ls $HOME/StarCraftII/Versions | grep Base)


yellow "Python version $PYTHON_VERSION is installed at $PYTHON_WHERE"
yellow "StarCraftII version $SC2_VERSION is installed"

echo
echo
yellow "To enter the Singularity environment, run:"
echo
yellow "    $SOURCE_DIR/singularity.sh"
