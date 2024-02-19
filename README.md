# Dotfiles
This is my clientsetup

## clean restore

1. Restore `.ssh/{config,gs,git,ed255}` keys from backup
2. Install `comtrya`
```bash
$ mkdir bin
$ curl -fsSL https://get.comtrya.dev | sh
$ mv comtrya-x86_64-apple-darwin bin/comtrya
```
3. Install `homebrew` 
```bash
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
2. Pull `dotfiles` repo
```bash
$ mkdir -p vcs/github/nce/
$ cd vcs/github/nce
$ git clone https://github.com/nce/dotfiles.git
# Install developer tools
$ cd dotfiles/comtrya
$ ~/bin/comtrya apply
```
5. Restore Tooling
```
// vim
:PackerSync
// Tmux Plugin Sync
<C-a> I
```


# Deprecated: Client Installation
Current Backup:
* `.ssh`
* `.gnupg`

1. install Homebrew

2. install rosetta
```bash
sudo softwareupdate --install-rosetta
```

## Apple M1
```
# Mac Setup
/usr/local/opt/fzf/install # yes yes yes yes
k krew install oidc-login
```

If the pinentry on mac won't work out of the box (no graphical method to allow
saving passphrase to keychain); We need to kill gpg-agent.


