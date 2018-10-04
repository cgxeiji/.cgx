#!/bin/bash

# Create and update all the configurations symlinks automatically

echo -e "*** CGx CONFIGURATION ***"

# Neovim configuration
echo -e "... creating symlink for Neovim..."
echo -e "...... ln -sf ~/.cgx/.config/nvim/init.vim ~/.config/nvim/init.vim"
ln -sf ~/.cgx/.config/nvim/init.vim ~/.config/nvim/init.vim
echo -e "...... done!"

# i3 configuration
echo -e "... creating symlink for i3..."
echo -e "...... ln -sf ~/.cgx/.config/i3/config ~/.config/i3/config"
ln -sf ~/.cgx/.config/i3/config ~/.config/i3/config
echo -e "...... done!"

# ranger configuration
echo -e "... creating symlink for ranger..."
echo -e "...... ln -sf ~/.cgx/.config/ranger/rc.conf ~/.config/ranger/rc.conf"
ln -sf ~/.cgx/.config/ranger/rc.conf ~/.config/ranger/rc.conf
echo -e "...... done!"

# compton configuration
echo -e "... creating symlink for compton..."
echo -e "...... ln -sf ~/.cgx/.config/compton.conf ~/.config/compton.conf"
ln -sf ~/.cgx/.config/compton.conf ~/.config/compton.conf
echo -e "...... done!"

# tmux configuration
echo -e "... creating symlink for tmux..."
echo -e "...... ln -sf ~/.cgx/.tmux/.tmux.conf ~/.tmux.conf"
ln -sf ~/.cgx/.tmux/.tmux.conf ~/.tmux.conf
echo -e "...... done!"


# .Xresources configuration
echo -e "... creating symlink for .Xresources..."
echo -e "...... ln -sf ~/.cgx/.Xresources ~/.Xresources"
ln -sf ~/.cgx/.Xresources ~/.Xresources
echo -e "... updating xrbd .Xresources..."
# Reload .Xresources
echo -e "...... "xrbd ~/.Xresources
xrdb ~/.Xresources
echo -e "...... done!"
