
alias vi='vim'
alias py='python'
alias gvim='vim'
alias vifm='vifm .'
alias cl='clear'
alias ex='exit'
alias suspend='systemctl suspend'
alias cbibl='nmcli device wifi connect  FC:34:97:9C:36:A4 password M2208L103'
alias show='nmcli device wifi show'
alias batlevel='upower -i /org/freedesktop/UPower/devices/battery_BAT0 &&
   	timedatectl|grep Local|sed "s/\ *//">> ~/.battery_log &&
  	upower -i /org/freedesktop/UPower/devices/battery_BAT0 | 
	grep "capacity:"|sed "s/\ *//" >> ~/.battery_log &&
	echo ___>> ~/.battery_log && cat ~/.battery_log | tail'
alias vim="/usr/local/bin/vim"

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias tx='tmux'

alias vifm='vifm .'

