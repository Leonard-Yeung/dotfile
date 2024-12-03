export GPG_TTY=$(tty)
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"
export PATH="/opt/homebrew/opt/rustup/bin:$PATH"
export PATH="$PATH:/Users/leonardyeung/.venv/lib/python3.13/site-packages"
export PATH="/opt/homebrew/bin/:$PATH"
export PATH="$PATH:/Users/leonardyeung/.venv/bin/"
export PATH="/opt/homebrew/opt/mysql-client@8.4/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/mysql-client@8.4/lib"
export CPPFLAGS="-I/opt/homebrew/opt/mysql-client@8.4/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql-client@8.4/lib/pkgconfig"
export SONNET_KEY=
export DGG_AI_KEY=

# fnm
FNM_PATH="/Users/leonardyeung/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/Users/leonardyeung/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi
eval "$(fnm env --use-on-cd --version-file-strategy=recursive --resolve-engines)"
eval "$(fnm completions --shell zsh)"
