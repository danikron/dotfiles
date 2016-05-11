# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -U compinit
compinit
# End of lines added by compinstall

#This sets the dynamic window title
case $TERM in
    xterm*|*rxvt*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac

#This enables the use of colors
#autoload -U colors && colors

#This sets autocd
#setopt autocd

#This sets cd to never select parent directory
zstyle ':completion:*:cd:*' ignore-parents parent pwd

#This removes the trailing slash of directories used as arguments
zstyle ':completion:*' squeeze-slashes true

#This activates auto-correction
setopt correct

#This loads a syntax highlighting plugin
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#This hides gtk3 app messages about not being able to register with accessibility bus
export NO_AT_BRIDGE=1

#This sets autocomplete for aliases
setopt completealiases

#This sets default editor to nano
export EDITOR=vim

#Aliases
#alias please='sudo $(fc -nl -1)'
alias -g L="|less -FX"
#alias syu="sudo aura -Syu && sudo aura -Aua"
alias syu="pacaur -Syu && echo "U" > $PANEL_FIFO"
#alias rbgit="~/dotfiles/rbgit.sh"
alias rbgit="pacaur -Syu --devel"
alias rdpkg="pacman -Qtd"
alias clnpkg="~/dotfiles/clnpkg.sh"
alias x="chmod +x"
alias sx="sudo chmod +x"
alias ls="ls -X --color=auto"
alias ll="ls -lhX --color=auto"
alias e="vim"
alias se="sudoedit"
alias ..="cd .."
alias ..2="cd ../.."
alias rm="noglob rm"
alias zathurat="tabbed -cd zathura -e"

alias school="cd ~/Dropbox/School/KAU/"

mkcd () 
{ 
	mkdir -p "$1";
	cd "$1"
}

ne ()
{
	(urxvt -e vim "$@" &) 
} 

nse ()
{
	(urxvt -e sudoedit "$@" &) 
}

nt ()
{
	(urxvt -cd "`pwd`" &)
}

new ()
{
	(urxvt -e "$@" &)
}

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" history-beginning-search-forward

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
