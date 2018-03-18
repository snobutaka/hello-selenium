#!/bin/bash
if [ -f "/var/vagrant_provision" ]; then
    exit 0
fi

sudo apt-get update && sudo apt-get install -y gcc make bzip2 libssl-dev libreadline-dev zlib1g-dev wget git firefox xfce4 virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11 # ubuntu-desktop
sudo VBoxClient-all

tar -zxf geckodriver-v0.20.0-linux64.tar.gz
sudo mv geckodriver /usr/local/bin

git clone https://github.com/rbenv/rbenv.git      ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

export PATH="/home/vagrant/.rbenv/bin:$PATH"
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"'               >> ~/.bashrc
eval "$(rbenv init -)"
rbenv install 2.5.0
rbenv rehash
rbenv global 2.5.0
gem install selenium-webdriver

sudo touch /var/vagrant_provision
