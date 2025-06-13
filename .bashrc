# ~/.bashrc

eval "$(starship init bash)"
eval "$(zoxide init bash)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export STARSHIP
export JAVA_HOME=/usr/lib/jvm/java-24-openjdk/
export PATH=$JAVA_HOME/bin:$PATH

alias ls='eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias grep='grep --color=auto'
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'
alias cd='z'
alias cls='clear && fastfetch'

PS1='[\u@\h \W]\$ '

pfetch
