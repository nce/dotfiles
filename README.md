# Client Installation

Backup:
* `.ssh`
* `.gnupg`

## Apple M1
```
# Shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Mac Setup
brew install --cask alacritty
brew tap homebrew/cask-fonts
brew install --cask font-inconsolata-go-nerd-font
brew install tmux nvim ripgrep fzf bat fd
brew install danielfoehrkn/switch/switch
#brew install --cask emacs
#git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
#brew install --cask font-source-code-pro
brew install --cask microsoft-teams slack discord
brew install macpass mactex gnuplot qrencode pandoc gopls
brew install helm norwoodj/tap/helm-docs
brew install terraform ansible jq pwgen tflint pre-commit oci-cli awscli kubectl kustomize krew pinentry-mac helm gh k9s
brew install hashicorp/tap/terraform-ls
brew install --cask obsidian

brew tap homebrew/cask-drivers
brew install garmin-express elgato-control-center elgato-stream-deck

/usr/local/opt/fzf/install # yes yes yes yes
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

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
