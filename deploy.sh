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

# vimrc
rm ~/.vimrc
ln -s ~/JLConfig/.vimrc ~/.vimrc

# cpp.vim
rm ~/.vim/ftplugin/cpp.vim
ln -s ~/JLConfig/cpp.vim ~/.vim/ftplugin/cpp.vim

# python.vim
rm ~/.vim/ftplugin/python.vim
ln -s ~/JLConfig/python.vim ~/.vim/ftplugin/python.vim

# zshrc
rm ~/.zshrc
ln -s ~/JLConfig/.zshrc ~/.zshrc

# zshrc_theme
rm ~/.oh-my-zsh/custom/themes/jlc.zsh-theme
ln -s ~/JLConfig/jlc.zsh-theme ~/.oh-my-zsh/custom/themes/jlc.zsh-theme
