#!/bin/bash
# Configurar Git
HOME=/home/feldmann/
git config --global user.name "Carlos Feldmann"
git config --global user.email "feldmannjunior@gmail.com"

echo 'source /etc/profile.d/undistract-me.sh' >> $HOME/.bashrc

# Copiando meus aliases
if [ -f $HOME/.bash_aliases ]; then
    mv $HOME/.bash_aliases $HOME/.bash_aliases_old
fi

cp $SCRIPT_DIR/configs/aliases.sh $HOME/.bash_aliases

# Faculdade bloqueia a porta 22, configurar o ssh pra usar porta 443 com os hosts github,gitlab,bitbucket
if [ ! -f $HOME/.ssh/config ]; then
    cp $SCRIPT_DIR/configs/ssh_config $HOME/.ssh/config 
fi

# Global Gitignore file
# Removing old one
rm -rf $HOME/.gitignore
# Coping the new one
cp $SCRIPT_DIR/configs/global.gitignore $HOME/.gitignore
# Adding to the git global config
git config --global core.excludesFile $HOME/.gitignore
