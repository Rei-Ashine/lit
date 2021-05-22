#!/bin/bash

echo -----
echo "Installing pyenv..."
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
wait
cd ~/.pyenv && src/configure && make -C src
wait

echo -----
echo "Adding a command to read environment variables to .bash_profile..."
echo "" >> ~/.bash_profile
echo "# --- For pyenv" >> ~/.bash_profile
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init --path)"' >> ~/.bash_profile
wait

echo -----
echo "Adding a command to read environment variables to .bashrc..."
echo "" >> ~/.bashrc
echo "# --- For pyenv" >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
exec "$SHELL"
