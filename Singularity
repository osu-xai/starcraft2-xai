BootStrap: docker
From: ubuntu:16.04

%help
This is an Ubuntu 16.04 Singularity container that has packages needed to run pysc2

%runscript
    echo "Arguments received: $*"
    exec /usr/bin/python "$@"

%setup
    # Runs from outside the container during Bootstrap


%post
    # Runs within the container during Bootstrap

    # Install the commonly used packages (from repo)
    apt-get update && apt-get install -y --no-install-recommends \
        apt-utils \
        build-essential \
        curl \
        git \
        libopenblas-dev \
        libcurl4-openssl-dev \
        libfreetype6-dev \
        libpng-dev \
        libzmq3-dev \
        locales \
        python-pip \
        pkg-config \
        python-dev \
        python-setuptools \
        rsync \
        software-properties-common \
        unzip \
        vim \
        zip \
        zlib1g-dev
    apt-get clean

    # Set up some required environment defaults
    locale-gen "en_US.UTF-8"
    dpkg-reconfigure locales
    export LANGUAGE="en_US.UTF-8"
    echo 'LANGUAGE="en_US.UTF-8"' >> /etc/default/locale
    echo 'LC_ALL="en_US.UTF-8"' >> /etc/default/locale

    echo ". /etc/profile.d/91-chpc.sh" >> /etc/bash.bashrc

%environment
PATH=/usr/local/bin:$PATH
LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

%test
    # Sanity check that the container is operating
    echo hello world
