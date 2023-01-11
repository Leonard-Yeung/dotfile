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

### Emacs with Scala setup
```bash
# Make sure to use coursier v1.1.0-M9 or newer.
curl -L -o coursier https://git.io/coursier-cli
chmod +x coursier
./coursier bootstrap \
  --java-opt -Xss4m \
  --java-opt -Xms100m \
  --java-opt -Dmetals.client=emacs \
  org.scalameta:metals_2.13:0.11.9 \
  -r bintray:scalacenter/releases \
  -r sonatype:snapshots \
  -o /usr/local/bin/metals-emacs -f
```

### Chad Neovim Setup
Put `./custom_chadnv_config` into `~/.config/nvim/lua/` and rename the directory into `custom`
Then, in the vim command line, enter `:PackerSync`, `:MasonInstallAll`
