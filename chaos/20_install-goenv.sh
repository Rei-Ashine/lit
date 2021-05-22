#!/bin/bash

echo -----
echo "Installing goenv..."
git clone https://github.com/syndbg/goenv.git ~/.goenv
wait

echo -----
echo "Adding a command to read environment variables to .bash_profile..."
echo "" >> ~/.bash_profile
echo "# --- For goenv" >> ~/.bash_profile
echo 'export GOENV_ROOT="$HOME/.goenv"' >> ~/.bash_profile
echo 'export PATH="$GOENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(goenv init -)"' >> ~/.bash_profile
echo 'export PATH="$GOROOT/bin:$PATH"' >> ~/.bash_profile
echo 'export PATH="$PATH:$GOPATH/bin"' >> ~/.bash_profile
wait

echo -----
echo "Adding a command to read environment variables to .bashrc..."
echo "" >> ~/.bashrc
echo "# --- For goenv" >> ~/.bashrc
echo -e 'if command -v goenv 1>/dev/null 2>&1; then\n  eval "$(goenv init -)"\nfi' >> ~/.bashrc
exec "$SHELL"
wait
