export PATH="$PATH:/usr/bin/"
export PATH="$PATH:/usr/share/"
export PATH="$PATH:/usr/local/bin/"
export PATH="$PATH:$HOME/.local/bin"
source $HOME/.venv/bin/activate
export GPG_TTY=$(tty)

export TERM="screen-256color"

export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

# fnm
FNM_PATH="/home/leonard0503/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/leonard0503/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
eval "$(fnm env --use-on-cd --shell zsh)"

# Neovim ENV Key for Avante.nvim plugin
export SONNET_KEY=
