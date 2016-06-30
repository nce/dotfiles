" Author:   Ulli Goschler <ulligoschler@gmail.com>
" Created:  Sun, 26.04.2009 - 19:52:23
" Modified: Thu, 30.06.2016 - 16:33:45
"
" Vundle Install
set nocompatible
filetype off
if has ("win32")
    set rtp+=$HOME/vimfiles/bundle/Vundle.vim
else
    set rtp+=~/.vim/bundle/Vundle.vim
endif
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'   " Solarized Colorscheme
Plugin 'Timestamp.vim'                      " Timestamps in file headers
Plugin 'openssl.vim'                        " Openssl onthefly de/encryption
Plugin 'vim-airline/vim-airline'            " Airline as Statusline
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'              " Tmux Statusline Generation with Airlinesupport
Plugin 'chriskempson/base16-vim'            " Base16 Colorscheme
Plugin 'christoomey/vim-tmux-navigator'     " Seamlessly navigate through panes/splits with same vim binding
Plugin 'tpope/vim-fugitive'                 " Git Support
Plugin 'tpope/vim-surround'                 " Edit surroundings of text objects
Plugin 'tpope/vim-commentary'               " Edit comments of things
Plugin 'tpope/vim-repeat'                   " Enable plugin repeating with .
Plugin 'scrooloose/syntastic'               " Syntastic Syntax checking
Plugin 'scrooloose/nerdtree'                " FS Browser
Plugin 'puppetlabs/puppet-syntax-vim'       " Puppet Syntax Highlighting
Plugin 'mattn/emmet-vim'                    " WEB emmet vim suite
Plugin 'groenewege/vim-less'                " WEB less syntax hl

" increases *.php load time to an unbearable level
"Plugin 'skammer/vim-css-color'              " WEB show css/less/sass color

"Plugin 'jiangmiao/auto-pairs'               " breaks digraph <BS> insertion
"Plugin 'townk/vim-autoclose'                " same problem
"Plugin 'Raimondi/delimitMate'               " same problem
Plugin 'ctrlpvim/ctrlp.vim'                 " File, buffer tag browser in vim
Plugin 'marcweber/vim-addon-mw-utils'       " snipmate dep
Plugin 'tomtom/tlib_vim'                    " snipmate dep
Plugin 'garbas/vim-snipmate'                " Snipmate with snipptes in .vim/snippets
Plugin 'jamessan/vim-gnupg'                 " GnuPG
call vundle#end()                           " Required

filetype plugin indent on  " Different behaviour based on filetype

let g:AutoPairsMapBS=0


set noshowmode             " Don't display Insert/Visual Mode on Bottom; Done with airline
set laststatus=2           " Display a status Line
set modeline               " Allow file specific vim settings

set mouse=a
set number                 " Show Absolute Line Numbers in Current Line
set relativenumber         " Show Relative Line Numbers

imap jk <ESC>

" -- Visuals --
syntax enable              " Syntax Highlighting
"let base16colorspace=256
set background=dark
colorscheme base16-flat
if has("gui_running")
    set guifont=Inconsolata\ for\ Powerline:h15
endif


let mapleader=","          " Define  leader Key \ Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" -- Splits --
set splitbelow
set splitright


" Trim trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

set encoding=utf-8
set fileencoding=utf-8
set backspace=2         " Fixed Backspace issue on older Systems
set scrolloff=5         " Scroll when Screen end is in 5 lines
set clipboard=unnamed   " Use system clipboard

" Show meta chars
set list
set listchars=eol:¬,tab:··,trail:~,extends:>,precedes:<


set ignorecase          " Ignore case on matching
set smartcase           " But only when search is all lower case
set incsearch           " Incremental searching
set hlsearch            " Highlight matches

" -- Wording --
au Filetype puppet set listkeys-=:     " Make : a word delimiter in puppet files

" -- Tabs --
set noexpandtab         " Don't insert Spaces for tabs
"set autoindent         " Copy indent from current line to new one
set smartindent         " Ident newlines
set tabstop=4           " How many spaces should be DISPLAYED as one tab
set shiftwidth=0        " How many spaces should be INSERTED as one tab; If set to '0', it uses tabstop value as default

" -- File specific behaviour --
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype php setlocal expandtab tabstop=4 shiftwidth=4
"autocmd Filetype tex setlocal noexpandtab tabstop=2 shiftwidth=2

set formatoptions+=rco  " t - autowrap to textwidth
                        " c - autowrap comments to textwidth
                        " r - autoinsert comment leader with <Enter>
                        " q - allow formatting of comments with :gq

highlight OverLength ctermbg=red ctermfg=white ctermbg=darkred
match OverLength /\%81v.\+/

inoremap <F6> # <C-R>=getcwd()<CR>i/<C-R>%<CR>Author:   Ulli Goschler <ulligoschler@gmail.com><CR>Created:  <ESC>"=strftime("%a, %d.%m.%Y - %H:%M:%S ")<CR>p<ESC>oModified: Tue, 01.01.1970 - 13:37:00<CR>


" -- Text writing --
let g:tex_flavor='latex'
au FileType tex set digraph                     " Fancy utf8 representations
au FileType tex setlocal spell spelllang=de     " german spellchecking on latex files
let g:tex_comment_nospell=1                     " but not on comments

" -- Plugins --
" Nerdtree
map <C-b> :NERDTreeToggle<CR>
" Timestamp.vim
let timestamp_regexp = '\v\C%(<(Last )?%([cC]hanged?|[Mm]odified):\s+)@<=.*$'
let g:timestamp_rep = '%a, %d.%m.%Y - %H:%M:%S'
let g:timestamp_modelines = 8
" Airline.vim
let g:airline_powerline_fonts = 1   " If iTerm2 uses patched Powerline fonts, allow them
let g:airline_theme='papercolor'
"let g:airline_theme='base16'
" Show a short mode in the Statusline
let g:airline_mode_map = {
    \ 'n' : 'N' ,
    \ 'i' : 'I' ,
    \ 'v' : 'V' ,
    \ 'R' : 'R' ,
    \ }
"let g:airline_section_y = airline#section#create(['%{v:servername}'])  " Remove tagbar, filetype, virtualenv, add servername
"let g:airline_section_x = ''
"
" GnuPG
let g:GPGPreferArmor=1                    " Tell the GnuPG plugin to armor new files
let g:GPGPreferSign=0                     " Tell the GnuPG plugin to sign new files
let g:GPGDefaultRecipients=["Encrypt"]
augroup GnuPGExtra
" Set extra file options.
    autocmd BufReadCmd,FileReadCmd *.\(gpg\|asc\|pgp\) call SetGPGOptions()
" Automatically close unmodified files after inactivity.
    autocmd CursorHold *.\(gpg\|asc\|pgp\) quit
augroup END

function SetGPGOptions()
" Set updatetime to 1 minute.
    set updatetime=60000
" Fold at markers.
    set foldmethod=marker
" Automatically close all folds.
    set foldclose=all
" Only open folds with insert commands.
    set foldopen=insert
endfunction

" Yank WORD to system clipboard in normal mode
nmap <leader>y "+yE

" Yank selection to system clipboard in visual mode
vmap <leader>y "+y

" -- Mappings --
nmap <leader>ev :tabedit $MYVIMRC<CR>
nmap <leader><space> :nohlsearch<CR>

