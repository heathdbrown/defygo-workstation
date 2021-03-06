#!/bin/bash
sudo apt-get -y update 
# Base packages for rvm, pgsql, git, and rails.
sudo apt-get -y install chromium-browser build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev meld libpq-dev
# git complete
wget --no-check-certificate https://github.com/git/git/raw/master/contrib/completion/git-completion.bash
mv git-completion.bash .git-completion.sh
# RVM
bash < <( curl http://rvm.beginrescueend.com/releases/rvm-install-head )
rm ~/.bashrc
wget --no-check-certificate https://github.com/andyhky/defygo-workstation/raw/master/.bashrc
sed -i "s/andyhky/$USER/g" .bashrc
source ~/.bashrc
rvm get head
rvm reload
rvm install 1.9.2 
rvm --create use 1.9.2@defygo
rvm --default use 1.9.2@defygo
gem update --system
gem install rails --version 3.0.4
mkdir rails_projects
# git configuration
git config --global user.name "$1"
git config --global user.email "$2"
git config --global merge.tool meld
git config --global core.editor gedit
# gmate gedit textmate styles
git clone git://github.com/gmate/gmate.git
cd gmate
sudo ./install.sh
sudo chown -R $USER:$USER ~/.gnome2/gedit
cd ..
git clone git://github.com/mig/gedit-themes.git
mkdir ~/.gnome2/gedit/styles
cp gedit-themes/*.xml ~/.gnome2/gedit/styles