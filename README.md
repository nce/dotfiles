# Client Installation

Backup:
* `.ssh`
* `.gnupg`
* `.gitconfig`

1. install Homebrew

2. install rosetta
```bash
sudo softwareupdate --install-rosetta
```

2. install prezto

3. send obsidian vault

3. install [eurkey](https://github.com/jonasdiemer/EurKEY-Mac)
setup capslock as control

3. install tmux 
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
3. system setup
```bash
brew install --cask alacritty
brew tap homebrew/cask-fonts
brew install --cask font-inconsolata-go-nerd-font
brew install tmux nvim ripgrep fzf bat fd git npm
```

6. apps
```bash
brew tap homebrew/cask-drivers
brew install obsidian slack discord macpass mactex gnuplot qrencode pandoc gopls brave-browser
brew install --cask garmin-express elgato-control-center elgato-stream-deck elgato-camera-hub

```

7. dev stuff
```
brew install terraform ansible jq pwgen pre-commit oci-cli awscli kubectl kustomize krew pinentry-mac helm gh k9s
```

## Apple M1
```
# Mac Setup
#brew install danielfoehrkn/switch/switch

/usr/local/opt/fzf/install # yes yes yes yes
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

k krew install oidc-login
```

If the pinentry on mac won't work out of the box (no graphical method to allow
saving passphrase to keychain); We need to kill gpg-agent.

# Dotfiles
This is a collection of my non-private, important dotfiles. As well as some
LaTeX templates

