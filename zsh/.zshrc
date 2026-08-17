export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias lg="lazygit"

eval "$(fnm env --use-on-cd --shell zsh)"
eval "$(zoxide init zsh)"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init - zsh)"

. "$HOME/.local/bin/env"

# bun completions
[ -s "/Users/karan/.bun/_bun" ] && source "/Users/karan/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# opencode
export PATH=/Users/karan/.opencode/bin:$PATH

alias oc="opencode"
alias ngconfig="nvim ~/Library/Application\ Support/ngrok/ngrok.yml"
alias ocr="opencode -c"
alias nv="nvim"
alias vim="nvim"

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

