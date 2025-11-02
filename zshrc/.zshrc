typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
#

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mcreinii/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Functions
set_nvim () {
  echo "Your nvim config name: "
  read nvim_config
  export NVIM_APPNAME=$nvim_config
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Created by `pipx` on 2025-10-20 10:53:18
export PATH="$PATH:/home/mcreinii/.local/bin"

asciify -w 30 $HOME/.settings/ascii.* $HOME/.settings/ascii.txt > /dev/null 2>&1

if [ -e "$HOME/.settings/ascii.txt" ]; then
  cat "$HOME/.settings/ascii.txt"
fi

eval "$(zoxide init zsh)"

# Aliases 
alias vim=nvim

if command -v z &> /dev/null; then
  echo 'zoxide exists, using z for cd instead.'
  alias cd=z
fi
