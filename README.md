# Dotfiles
This is my clientsetup

## clean restore

1. Restore `.ssh/{config,gs,git,ed255}` keys from backup

1. Restore `.gnupg` from backup

1. Restore `.oci` from backup

1. Install `comtrya`    
    ```bash
    $ mkdir bin
    $ curl -fsSL https://get.comtrya.dev | sh
    $ mv comtrya-x86_64-apple-darwin bin/comtrya
    ```

1. Install `homebrew` 
    ```bash
    $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```

1. Pull `dotfiles` repo
    ```bash
    $ mkdir -p vcs/github/nce/
    $ cd vcs/github/nce
    $ git clone https://github.com/nce/dotfiles.git
    # Install developer tools
    $ cd dotfiles/comtrya
    $ ~/bin/comtrya apply
    ```
