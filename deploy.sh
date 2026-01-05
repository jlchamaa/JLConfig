#! /bin/bash
cd ~

# bash profile
rm ~/.bash_profile
ln -s ~/JLConfig/.bash_profile ~/.bash_profile

# bashrc
rm ~/.bashrc
ln -s ~/JLConfig/.bashrc ~/.bashrc

# dircolors
rm ~/.dircolors
ln -s ~/JLConfig/.dircolors ~/.dircolors

# inputrc
rm ~/.inputrc
ln -s ~/JLConfig/.inputrc ~/.inputrc

# shellrc
rm ~/.shellrc
ln -s ~/JLConfig/.shellrc ~/.shellrc

# tmux conf
rm ~/.tmux.conf 
ln -s ~/JLConfig/.tmux.conf ~/.tmux.conf

# nvim config 
rm ~/.config/nvim/init.lua
ln -s ~/JLConfig/init.lua ~/.config/nvim/init.lua
rm ~/.config/nvim/colors/ultraviolent.lua
ln -s ~/JLConfig/ultraviolent.lua ~/.config/nvim/colors/ultraviolent.lua
rm ~/.config/nvim/lua/plugins.lua
ln -s ~/JLConfig/plugins.lua ~/.config/nvim/lua/plugins.lua
rm ~/.config/nvim/lua/config/lazy.lua
ln -s ~/JLConfig/lazy.lua ~/.config/nvim/lua/config/lazy.lua

# zshrc
rm ~/.zshrc
ln -s ~/JLConfig/.zshrc ~/.zshrc

# zshrc_theme
rm ~/.oh-my-zsh/custom/themes/jlc.zsh-theme
ln -s ~/JLConfig/jlc.zsh-theme ~/.oh-my-zsh/custom/themes/jlc.zsh-theme
