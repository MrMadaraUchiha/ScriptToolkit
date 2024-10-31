#!/bin/bash
# Repositories
# =================================================================================================
# Spotify
DISTRO="$(lsb_release -s -c)"
curl -sS https://download.spotify.com/debian/pubkey.gpg | apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list

# Docker
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/debian $DISTRO stable" | tee /etc/apt/sources.list.d/docker.list

# VsCodium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | apt-key add -
echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | tee /etc/apt/sources.list.d/codium.list

# Nodejs
curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
echo "deb https://deb.nodesource.com/node_13.x $DISTRO main" | tee /etc/apt/sources.list.d/nodesource.list
echo "deb-src https://deb.nodesource.com/node_13.x $DISTRO main" | tee -a /etc/apt/sources.list.d/nodesource.list

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# AdoptOpenJDK
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
echo "deb https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ $DISTRO main" | tee /etc/apt/sources.list.d/adoptopenjdk.list

# Open Suse Strycore
# Lutris
echo 'deb http://download.opensuse.org/repositories/home:/strycore/Debian_10/ /' | tee /etc/apt/sources.list.d/home:strycore.list
wget -qO - https://download.opensuse.org/repositories/home:strycore/Debian_10/Release.key | apt-key add - 

# WineHQ
echo "deb https://dl.winehq.org/wine-builds/debian/ $DISTRO main" | tee /etc/apt/sources.list.d/winehq.list
wget -qO - https://dl.winehq.org/wine-builds/winehq.key | apt-key add -

# Virtual Box
echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $DISTRO contrib" | tee /etc/apt/sources.list.d/virtualbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

# UPDATE
apt-get update
# =================================================================================================
