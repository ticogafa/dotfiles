# Inicializa Starship
starship init fish | source

# Inicializa Zoxide
zoxide init fish | source

# Variáveis de Ambiente
set -x STARSHIP
set -x JAVA_HOME /usr/lib/jvm/java-24-openjdk/
set -x PATH $JAVA_HOME/bin $PATH

# Aliases
alias ls "eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias grep "grep --color=auto"
alias inv "nvim (fzf -m --preview=\"bat --color=always {}\")"
alias cls "clear; and fastfetch"
alias cd z
alias u "yay -Syu"
alias i "yay -S"

pfetch
