#!/bin/bash
echo "Installing ohmyzsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Oh my zsh installed"
echo "--------"
echo "Adding Chezmoi"

curl -sfL https://git.io/chezmoi | sh

echo "Chezmoi installed"

echo "Chezmoi add dotfiles...."

./bin/chezmoi init https://github.com/athul/dotfiles.git

./bin/chezmoi update

./bin/chezmoi apply
echo "Chezmoi Tasks completed"
echo "---------"
echo "Install Shelby"

sh -c "$(curl -sL https://git.io/ishelby)"

echo "Shelby Installed"


