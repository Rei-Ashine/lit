#!/bin/bash

echo -----
echo "Installing Linuxbrew..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
wait
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
wait

echo -----
echo "Adding a command to read environment variables to .bash_profile..."
echo "# --- For Linuxbrew" >> ~/.bash_profile
# For CentOS/Fedora/RedHat
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >> ~/.bash_profile
# For Debian/Ubuntu
#echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >> ~/.bash_profile
echo 'export PATH="$HOME/.linuxbrew/sbin:$PATH"' >> ~/.bash_profile
echo 'export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"' >> ~/.bash_profile
echo 'export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"' >> ~/.bash_profile

echo "# ---" >> ~/.bash_profile
echo 'export LDFLAGS="-L$HOME/.linuxbrew/opt/isl@0.18/lib"' >> ~/.bash_profile
echo 'export CPPFLAGS="-I$HOME/.linuxbrew/opt/isl@0.18/include"' >> ~/.bash_profile
echo 'export PKG_CONFIG_PATH="$HOME/.linuxbrew/opt/isl@0.18/lib/pkgconfig"' >> ~/.bash_profile
