#!/bin/bash

# Set up ssh config file
echo 'Setting up ssh config file...'
echo 'ServerAliveInterval 120' >> $HOME/.ssh/config
echo 'ServerAliveCountMax 10' >> $HOME/.ssh/config
echo 'ForwardAgent yes' >> $HOME/.ssh/config
echo 'TCPKeepAlive yes' >> $HOME/.ssh/config
echo 'VisualHostKey yes' >> $HOME/.ssh/config
echo '' >> $HOME/.ssh/config
echo 'Host github.com' >> $HOME/.ssh/config
echo '    HostName github.com' >> $HOME/.ssh/config
echo '    User git' >> $HOME/.ssh/config
echo 'done!'
wait

# Set up the instance
echo 'Setting up the instance...'
sudo apt update
sudo apt remove vim
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim git build-essential tmux htop
echo 'done!'
