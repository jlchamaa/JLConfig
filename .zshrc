# zmodload zsh/zprof # top of your .zshrc file
DISABLE_UNTRACKED_FILES_DIRTY="true"
source ~/.shellrc
source ~/.work_rc
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
unameOut="$(uname -a)"
case "$unameOut" in
    Linux?????-desktop* )     export ZSH="/home/jlchamaa/.oh-my-zsh";;
    Darwin?????-lapto*)    export ZSH="/Users/jlchamaa/.oh-my-zsh";;
    Linux?Fuzzy)    export ZSH="/mnt/c/Users/jlcha/WSL/.oh-my-zsh"; export ZSH_DISABLE_COMPFIX=true;;
esac
ZSH_THEME="jlc"
plugins=(
    bazel
    thefuck
)
eval $(thefuck --alias)
source $ZSH/oh-my-zsh.sh
export HISTSIZE=50000
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
set +H
# zprof
