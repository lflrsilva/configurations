# File: ~/.bash_profile
# Author: Luiz Fernando L. R. Silva
# Created: Qui 12 jul 2012
# Notes: Esse arquivo foi adaptado ao longo dos anos por diferentes 
#        distribuicoes e depende de outros arquivos

## Idenfificacao pessoal
[ -f ~/.bash_files/bash_user ] && source ~/.bash_files/bash_user

## Configurando Homebrew 
[ -f ~/.bash_files/bash_brew ] && source ~/.bash_files/bash_brew

## Configurando cores para o terminal 
[ -f ~/.bash_files/bash_colors ] && source ~/.bash_files/bash_colors

## Configurando PROMPT_COMMAND
[ -f ~/.bash_files/bash_term ] && source ~/.bash_files/bash_term

## Configurando apps
[ -f ~/.bash_files/bash_apps ] && source ~/.bash_files/bash_apps

## Comandos simples de terminal e apps de sistema
[ -f ~/.bash_files/bash_alias ] && source ~/.bash_files/bash_alias

## Comandos para conexao
[ -f ~/.bash_files/bash_connections ] && source ~/.bash_files/bash_connections

## Carregar integracao ITERM2
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# alias mpicc='/opt/local/bin/openmpicc'
