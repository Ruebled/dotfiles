#
# ~/.bash_profile
#


[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

