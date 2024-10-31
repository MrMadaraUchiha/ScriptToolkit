#!/bin/bash
# After installation script for my needs in Debian buster
# Run this script with root privilages
# You have to install the nvidia driver manually
set -e
set -x
export TEMP_DIR=./temp
export SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
rm -rf $TEMP_DIR
mkdir $TEMP_DIR
# Enabling Non-free contrib packages
sudo sed -i -r 's/buster main ?$/buster main contrib non-free/' /etc/apt/sources.list
sudo sed -i -r 's/buster-updates main ?$/buster-updates main contrib non-free/' /etc/apt/sources.list
sudo sed -i -r 's/buster\/updates main ?$/buster\/updates main contrib non-free/' /etc/apt/sources.list
USER=feldmann

# Adding support for 32 bits packages
dpkg --add-architecture i386
apt-get update && apt-get upgrade -y
apt-get install -y curl \
    wget \
    vim \
    snapd \
    tilix \
    barrier \
    apt-transport-https \
    ca-certificates \
    gnupg2 \
    software-properties-common \
    maven \
    qemu-kvm \
    libvirt-clients \
    libvirt-daemon-system \
    php7.3-cli \
    bash-completion \
    chromium \
    i3 \
    ffmpeg \
    vlc \
    xclip \
    rar \
    unrar \
    kodi \
    pavucontrol \
    dnsutils \
    pwgen \
    libnotify-bin \
    undistract-me \
    ktorrent
    
# Iniciando snap
systemctl start snapd.service

# Removing old packages
apt-get remove docker docker-engine docker.io containerd runc

# Additional Repositories
source $SCRIPT_DIR/repositories.sh
# Install Additional Packages
apt-get update && apt-get install -y \
    spotify-client \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    nodejs \
    yarn \
    codium \
    adoptopenjdk-8-hotspot \
    libvulkan1:i386 \
    vulkan-utils \
    winetricks \
    winehq-stable \
    lutris \
    virtualbox-6.1 

# Add my user to applications groups
usermod -aG docker $USER
usermod -aG libvirt $USER

# User Commands
sudo -u $USER bash -c $SCRIPT_DIR/user.sh
# Snap Packages
# ======================
# Instalando PhpStorm
snap install phpstorm --classic
# IDEA
snap install intellij-idea-ultimate --classic
# Postman
snap install postman
# ======================

# Arquivos Binarios
source $SCRIPT_DIR/binaries.sh
# Apps
sudo -u $USER bash -c $SCRIPT_DIR/apps.sh
# Pacotes Debian
source $SCRIPT_DIR/debs.sh
# Configurações
source $SCRIPT_DIR/config.sh