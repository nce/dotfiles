# Dotfiles
This is my clientsetup

Setup with [comtrya](https://github.com/comtrya/comtrya):
```bash
$ curl -fsSL https://get.comtrya.dev | sh
$ comtrya apply
```

# Client Installation
Current Backup:
* `.ssh`
* `.gnupg`

1. install Homebrew

2. install rosetta
```bash
sudo softwareupdate --install-rosetta
```

3. install [eurkey](https://github.com/jonasdiemer/EurKEY-Mac)
setup capslock as control

6. apps
```bash
brew tap homebrew/cask-drivers
brew install --cask garmin-express elgato-control-center elgato-stream-deck elgato-camera-hub

```

## Apple M1
```
# Mac Setup
/usr/local/opt/fzf/install # yes yes yes yes
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

k krew install oidc-login
```

If the pinentry on mac won't work out of the box (no graphical method to allow
saving passphrase to keychain); We need to kill gpg-agent.


