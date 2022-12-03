zimfw() { source /Users/leonardyeung/.zim/zimfw.zsh "${@}" }
zmodule() { source /Users/leonardyeung/.zim/zimfw.zsh "${@}" }
typeset -g _zim_fpath=(/Users/leonardyeung/.zim/modules/git/functions /Users/leonardyeung/.zim/modules/utility/functions /Users/leonardyeung/.zim/modules/duration-info/functions /Users/leonardyeung/.zim/modules/git-info/functions /Users/leonardyeung/.zim/modules/zsh-completions/src /Users/leonardyeung/.zim/modules/zsh-completions/src)
fpath=(${_zim_fpath} ${fpath})
autoload -Uz -- git-alias-lookup git-branch-current git-branch-delete-interactive git-branch-remote-tracking git-dir git-ignore-add git-root git-stash-clear-interactive git-stash-recover git-submodule-move git-submodule-remove mkcd mkpw duration-info-precmd duration-info-preexec coalesce git-action git-info
source /Users/leonardyeung/.zim/modules/environment/init.zsh
source /Users/leonardyeung/.zim/modules/git/init.zsh
source /Users/leonardyeung/.zim/modules/input/init.zsh
source /Users/leonardyeung/.zim/modules/termtitle/init.zsh
source /Users/leonardyeung/.zim/modules/utility/init.zsh
source /Users/leonardyeung/.zim/modules/duration-info/init.zsh
source /Users/leonardyeung/.zim/modules/asciiship/asciiship.zsh-theme
source /Users/leonardyeung/.zim/modules/completion/init.zsh
source /Users/leonardyeung/.zim/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /Users/leonardyeung/.zim/modules/zsh-history-substring-search/zsh-history-substring-search.zsh
source /Users/leonardyeung/.zim/modules/zsh-autosuggestions/zsh-autosuggestions.zsh
source /Users/leonardyeung/.zim/modules/asciiship/asciiship.zsh-theme
source /Users/leonardyeung/.zim/modules/completion/init.zsh
source /Users/leonardyeung/.zim/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /Users/leonardyeung/.zim/modules/zsh-autosuggestions/zsh-autosuggestions.zsh
source /Users/leonardyeung/.zim/modules/zsh-alias-finder/zsh-alias-finder.plugin.zsh
source /Users/leonardyeung/.zim/modules/alias-zsh/alias-zsh.plugin.zsh
source /Users/leonardyeung/.zim/modules/cd-ls/cd-ls.zsh
source /Users/leonardyeung/.zim/modules/colored-man-pages_mod/colored-man-pages_mod.plugin.zsh
source /Users/leonardyeung/.zim/modules/colorize/colorize.plugin.zsh
source /Users/leonardyeung/.zim/modules/zsh-exa-ls-plugin/zsh-exa-ls-plugin.plugin.zsh
source /Users/leonardyeung/.zim/modules/zsh-nvm/zsh-nvm.plugin.zsh
source /Users/leonardyeung/.zim/modules/git-aliases/git-aliases.zsh
source /Users/leonardyeung/.zim/modules/zsh-git-lfs/zsh-git-lfs.zsh
source /Users/leonardyeung/.zim/modules/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh
source /Users/leonardyeung/.zim/modules/zsh-startup-timer/init.zsh
source /Users/leonardyeung/.zim/modules/zsh-thefuck/init.zsh
source /Users/leonardyeung/.zim/modules/zsh-better-npm-completion/zsh-better-npm-completion.plugin.zsh
source /Users/leonardyeung/.zim/modules/zsh-yarn-autocompletions/yarn-autocompletions.plugin.zsh
