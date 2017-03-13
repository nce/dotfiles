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
