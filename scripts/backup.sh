# Dotfile backup script for WSL.

USER="huip" # Change to your own username.
PROJECTDIR="Projecten" # Change to your project directory.
cp -R ~/.vimrc /mnt/c/Users/$USER/$PROJECTDIR/dotfiles
