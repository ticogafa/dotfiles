# Inicializa Starship
starship init fish | source

# Inicializa Zoxide
zoxide init fish | source

# Variáveis de Ambiente
set -x STARSHIP
set -x JAVA_HOME /usr/lib/jvm/java-25-openjdk/
set -x PATH $JAVA_HOME/bin $PATH
set -x EDITOR nvim

# Aliases
alias ls "eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias grep "rg --color=auto"
alias inv "nvim (fzf -m --preview=\"bat --color=always {}\")"
alias cls "clear; and fastfetch"
alias cd z
alias u "sudo pacman -Syu"
alias i "yay -S --needed"
alias r "yay -Rns"
alias pipes "pipes.sh"
alias cbonsai "cbonsai -S"
alias ping "gping -4"
alias scan "sudo lynis audit system"
alias music "yt-dlp -x --audio-format mp3 -o '~/Músicas/%(title)s.%(ext)s' --no-playlist"
alias h Hyprland
fish_add_path $HOME/.local/bin
