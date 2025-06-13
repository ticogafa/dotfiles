#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Verifica se a variável de ambiente FASTFETCH já foi configurada
if [ -z "$FASTFETCH_RUN" ]; then
  export FASTFETCH_RUN=true
  fastfetch
fi
