#!/bin/sh
sudo apt-get -y update 
sudo apt-get -y install chromium-browser build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev meld
wget --no-check-certificate https://github.com/git/git/raw/master/contrib/completion/git-completion.bash
mv git-completion.bash .git-completion.sh
echo "PS1='[\u@\h \W$(__git_ps1 \" (%s)\")]\$ '" >> ~/.bashrc
echo "source ~/.git-completion.sh" >> ~/.bashrc
bash < <( curl http://rvm.beginrescueend.com/releases/rvm-install-head )
echo "[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session." >> ~/.bashrc
source ~/.bashrc
rvm get head
rvm reload
rvm install 1.9.2 
rvm --create use 1.9.2@defygo
rvm --default use 1.9.2@defygo
gem update --system
gem install rails --version 3.0.4
mkdir rails_projects
git config --global user.name "$1"
git config --global user.email "$2"
git config --global merge.tool meld
git config --global core.editor gedit
git clone git://github.com/mig/gedit-rails.git
cd gedit-rails
sudo ~/.rvm/bin/rake-ruby-1.9.2-p136@defygo setup
sudo chown -R `whoami`:`whoami` ~/.gnome2/gedit
cd ..
git clone git://github.com/mig/gedit-themes.git
mkdir ~/.gnome2/gedit/styles
cp gedit-themes/*.xml ~/.gnome2/gedit/styles

