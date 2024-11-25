export PATH="$PATH:/usr/bin/"
export PATH="$PATH:/usr/bin/"
export PATH="$PATH:/usr/share/"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/lib/pypy3.10/site-packages/"
export PATH="/usr/local/bin/:$PATH"
export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin/"
export PATH="$PATH:$HOME/Applications"
source $HOME/.venv/bin/activate
export GPG_TTY=$(tty)

export TERM="screen-256color"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
export SONNET_KEY=
