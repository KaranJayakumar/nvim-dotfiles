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


. "$HOME/.local/bin/env"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/karan/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/karan/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.

if [ -f '/Users/karan/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/karan/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="$HOME/.local/bin:$PATH"

# Keep the Mac running with the lid closed. Restore normal sleep before travel.
mobile-work() {
  case "$1" in
    on)
      sudo pmset -a disablesleep 1
      ;;
    off)
      sudo pmset -a disablesleep 0
      ;;
    status)
      pmset -g custom | grep disablesleep
      ;;
    *)
      echo "Usage: mobile-work {on|off|status}"
      return 2
      ;;
  esac
}

