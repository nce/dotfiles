# Client Installation

Backup:
* `.ssh`
* `.gnupg`

1. install Homebrew

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
brew install tmux nvim ripgrep fzf bat fd git
```

6. apps
```bash
brew install obsidian slack discord macpass mactex gnuplot qrencode pandoc gopls
brew install --cask garmin-express elgato-control-center elgato-stream-deck

```

7. dev stuff
```
brew install terraform ansible jq pwgen tflint pre-commit oci-cli awscli kubectl kustomize krew pinentry-mac helm gh k9s
brew tap homebrew/cask-drivers
```

## Apple M1
```
# Shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Mac Setup
#brew install danielfoehrkn/switch/switch

brew tap homebrew/cask-drivers

/usr/local/opt/fzf/install # yes yes yes yes
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

k krew install oidc-login
```

If the pinentry on mac won't work out of the box (no graphical method to allow
saving passphrase to keychain); We need to kill gpg-agent.

# Dotfiles
This is a collection of my non-private, important dotfiles. As well as some
LaTeX templates
# iterm2
Iterm2 sollte die gepatchte Inconsolata Powerline Schriftart verwenden, die es
irgendwo auf github direkt zum Download gibt.

Wird das solarized Colorscheme in zb. vim verwendet, sollte das Terminal
dies entsprechend auch verwenden. Dabei kontrollieren, dass nicht das
falsche (?) base-16 256-Farben Profil verwendet wird.

# Base16
Um das Base16 Colorscheme überall zu verwenden müssen folgende Repos, gemäß
Anleitung ausgecheckt werden:
* [base16-shell](https://github.com/chriskempson/base16-shell)
* [base16-iterm2 base16-flat.dark.itemcolors](https://github.com/chriskempson/base16-iterm2)

# Vim
## Mac
### Blue Line Numbers
Ist die Zeilennummierung fälschlicherweise blau, dann ist keine
[base16-shell](https://github.com/chriskempson/base16-vim#blue-line-numbers)
verfügbar aber `let base16colorspace=256` trotzdem aktiviert.

Für iterm2-base16-flat muss dies deaktiviert sein.

### Digraph AutoClose Plugins
Die meisten autoclose Plugins überschreiben die `digraph`-<BS> Features, sodass
man keine Sonderzeichen mehr über diesen Weg einfügen kann.


