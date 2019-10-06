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

# tmux conf
rm ~/.tmux.conf 
ln -s ~/JLConfig/.tmux.conf ~/.tmux.conf

# vimrc
rm ~/.vimrc
ln -s ~/JLConfig/.vimrc ~/.vimrc
