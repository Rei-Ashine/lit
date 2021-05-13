#!/bin/bash

cd $(dirname $0)

echo -----
echo "Setting up vimrc file..."
cp Preference/.vimrc $HOME/
wait

echo -----
echo "Setting up tmux.conf file..."
cp Preference/.tmux.conf $HOME/
wait

echo -----
echo "Setting up ssh config file..."
echo "ServerAliveInterval 120" >> $HOME/.ssh/config
echo "ServerAliveCountMax 10" >> $HOME/.ssh/config
echo "ForwardAgent yes" >> $HOME/.ssh/config
echo "TCPKeepAlive yes" >> $HOME/.ssh/config
echo "VisualHostKey yes" >> $HOME/.ssh/config
echo "" >> $HOME/.ssh/config
echo "Host github.com" >> $HOME/.ssh/config
echo "    HostName github.com" >> $HOME/.ssh/config
echo "    User git" >> $HOME/.ssh/config
chmod 600 $HOME/.ssh/config
wait
