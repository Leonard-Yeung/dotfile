### Zim inital setup and cheatsheet
[Official Website](https://zimfw.sh/)
Configuration: At `~/.zimrc`
```bash
# To add modules
zmodule ${MODULE_NAME_HERE}
zmodule ${GIT_LINK_CAN_BE_INSERTED}
zmodule ${GIT_LINK_INSERTED_WITH_NO_INIT_FILE} --source ${SOMEFILE.zsh}
```


### Starship inital setup
```bash
curl -sS https://starship.rs/install.sh | sh
```
Then, append theis command at the end of ~/.zshrc
```bash
eval "$(starship init zsh)"
```
Theme config file at `~/.config/starship.toml`
[Config guideline](https://starship.rs/config)
