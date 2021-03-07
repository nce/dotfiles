" brew install tmux shellcheck fzf ripgrep

call plug#begin('~/.vim/plugged')
" Visualisierung
Plug 'vim-airline/vim-airline'            " Airline as Statusline
Plug 'vim-airline/vim-airline-themes'
"Plug 'edkolev/tmuxline.vim'               " Tmux Statusline Generation with
                                          " Airlinesupport
Plug 'christoomey/vim-tmux-navigator'     " Seamlessly navigate through
                                          " panes/splits with same vim binding
Plug 'morhetz/gruvbox'
Plug 'luochen1990/rainbow'                " Rainbow Parenthesis
" Movement/Handling
Plug 'tpope/vim-surround'                 " Edit surroundings of text objects
Plug 'tpope/vim-repeat'                   " Enable plugin repeating with .
Plug 'tpope/vim-unimpaired'               " Pairwise Movement
Plug 'scrooloose/syntastic'               " Syntastic Syntax checking
" FS Browser
Plug 'scrooloose/nerdtree'                " FS Browser
Plug 'Xuyuanp/nerdtree-git-plugin'        " git symbols in nerdtree tree
Plug 'unkiwii/vim-nerdtree-sync'

Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
" Git Integration
Plug 'airblade/vim-gitgutter'             " infile git diff signs
Plug 'tpope/vim-fugitive'                 " Git Support
Plug 'tommcdo/vim-fubitive'               " Bitbucket fugitive support
Plug 'stsewd/fzf-checkout.vim'            " Branch Suche
" Languages
Plug 'fatih/vim-go'
Plug 'puppetlabs/puppet-syntax-vim',     { 'for': 'puppet' }
Plug 'elixir-editors/vim-elixir',        { 'for': 'elixir' }
Plug 'hashivim/vim-terraform',           { 'for': 'terraform' }
Plug 'martinda/Jenkinsfile-vim-syntax',  { 'for': 'jenkinsfile' }
Plug 'itspriddle/vim-shellcheck',        { 'for': 'sh' }
Plug 'iamcco/markdown-preview.nvim',     { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Searching
Plug 'junegunn/fzf.vim'                   " Fuzzy file searching

" Auto Completion
 "Plug 'neoclide/coc.nvim',               {'branch': 'release'}
 "Plug 'antoinemadec/coc-fzf',            {'branch': 'release'}
"Plug 'neovim/nvim-lspconfig'

" increases *.php load time to an unbearable level
"Plugin 'skammer/vim-css-color'              " WEB show css/less/sass color
"Plugin 'jiangmiao/auto-pairs'               " breaks digraph <BS> insertion
"Plugin 'townk/vim-autoclose'                " same problem
"Plugin 'Raimondi/delimitMate'               " same problem
"Plugin 'vimwiki/vimwiki'                    " no orgmode replacement
" Initialize plugin system
call plug#end()


" -- Coc --
let g:coc_global_extensions = ['coc-git', 'coc-sh', 'coc-yaml', 'coc-go', 'coc-terraform']

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" TextEdit might fail if hidden is not set.
set hidden

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif











let g:AutoPairsMapBS=0

" -- Interface --
set noshowmode             " Don't display Insert/Visual Mode on Bottom;
                           " Done with airline
set laststatus=2           " Display a status Line
set modeline               " Allow file specific vim settings
set cursorline             " find cursor with line hightlight
set cursorcolumn
set number                 " Show Absolute Line Numbers in Current Line
set relativenumber         " Show Relative Line Numbers

" -- General Behaviour --
set directory=~/.vim/.swp// " Swap files in .vim
set autoread               " Ondisk change of file force refresh of buffer
set mouse=a
set history=1000           " Keep longer history
set showcmd                " Show incomplete commands at bottom
set undodir=~/.vim/.undo   " Location of undo dir
set undofile               " Keep Undo Info between sessions
set iskeyword-=_           " Underscore as word delimiter
" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" -- Tabs --
set expandtab              " Do insert Spaces for tabs
"set autoindent            " Copy indent from current line to new one
set tabstop=2              " How many spaces should be DISPLAYED as one tab
set shiftwidth=0           " How many spaces should be INSERTED as one tab; If set to '0', it uses tabstop value as default
filetype plugin indent on  " Different behaviour based on filetype

" -- Search --
set ignorecase             " Ignore case on matching
set smartcase              " But only when search is all lower case
set incsearch              " Incremental searching
set hlsearch               " Highlight matches
nnoremap n nzz             " Focus Highlight in the middle of screen
nnoremap N Nzz             " Focus Highlight in the middle of screen
nnoremap <CR> :noh<CR><CR> " Clear Search with Enter

" -- Visuals --
syntax enable              " Syntax Highlighting
set background=dark
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Colorschemes/Visualization
"colorscheme base16-flat
"colorscheme solarized
" colorscheme gruvbox
autocmd vimenter * ++nested colorscheme gruvbox

if has("gui_running")
    set guifont=Inconsolata\ for\ Powerline:h15
endif

" Leader Key
let mapleader=" "          " Define  leader Key \ Preserve indentation while pasting text from the OS X clipboard
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
"set clipboard=unnamed   " Use system clipboard

" Show meta chars
set list
set listchars=eol:¬,tab:··,trail:~,extends:>,precedes:<

nmap <leader>gf :Gblame<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit -v<cr>
nmap <leader>ga :Git add -p<cr>
nmap <leader>gp :Gpush<cr>
nmap <leader>gl :Gpull<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gh :FzfCommits<cr>
nmap <leader>gb :FzfGBranches<cr>
"nmap <leader>gb :lcd %:p:h<CR>:FzfCommits <bar> :lcd -<CR>
nmap <leader>j <Plug>(GitGutterNextHunk)
nmap <leader>k <Plug>(GitGutterPrevHunk)

" coc
nmap <silent> gd <Plug>(coc-definition)

" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1

nmap <space>r :RnvimrToggle<CR>
" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 0
" Map Rnvimr action
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }

" FZF Setup via homebrew
set rtp+=/usr/local/opt/fzf
let g:fzf_command_prefix = 'Fzf'
nnoremap <silent> <leader>o :FzfFiles<CR>
nnoremap <silent> <leader>l :FzfBLines<CR>
nnoremap <silent> <leader>b :FzfBuffer<CR>
nnoremap <silent> <leader>f :FzfRg<CR>

" floating fzf window
if has('nvim-0.4.0') || has("patch-8.2.0191")
    let g:fzf_layout = { 'window': {
                \ 'width': 0.9,
                \ 'height': 0.7,
                \ 'highlight': 'Comment',
                \ 'rounded': v:false } }
else
    let g:fzf_layout = { "window": "silent botright 16split enew" }
endif

" -- Wording --
au Filetype puppet set listkeys-=:     " Make : a word delimiter in puppet files


" -- File specific behaviour --
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype php setlocal expandtab tabstop=4 shiftwidth=4
"autocmd Filetype tex setlocal noexpandtab tabstop=2 shiftwidth=2

set formatoptions+=rco  " t - autowrap to textwidth
                        " c - autowrap comments to textwidth
                        " r - autoinsert comment leader with <Enter>
                        " q - allow formatting of comments with :gq

" -- Syntax Highlighting --
" Ansible
let g:ansible_name_highlight = 'd'

if exists('+colorcolumn')
  set colorcolumn=80
else
  highlight OverLength ctermbg=red ctermfg=white ctermbg=darkred
  match OverLength /\%81v.\+/
endif

inoremap <F7> --ugo[<ESC>"=strftime("%m.%Y")<CR>p<ESC>a]


" -- Text writing --
let g:tex_flavor='latex'
au FileType tex set digraph                     " Fancy utf8 representations
au FileType tex setlocal spell spelllang=de     " german spellchecking on latex files
let g:tex_comment_nospell=1                     " but not on comments

" -- Plugins --
" Rainbow Parenthesis
let g:rainbow_active = 1                        " default enabled

" fzf-checkout
let g:fzf_checkout_git_options = '--sort=-committerdate' " Sort git branches
let g:fzf_branch_actions = {
      \ 'create': {'keymap': 'ctrl-n'},
      \}

" Fubitive
let g:fubitive_domain_pattern = ''

" Nerdtree
map <C-b> :NERDTreeToggle<CR>

" highlight current file
let g:NERDTreeHighlightCursorline = 1

" open nerdtree if no file was specified for editing
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if nerdtree is last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" show hidden files
let NERDTreeShowHidden=1

" update nerdtree when changing buffers; not good with fzf
"let g:nerdtree_sync_cursorline = 1
map <leader>n :NERDTreeFind<cr>

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('md', 'Cyan', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'Yellow', 'none', 'Yellow', '#151515')



" Airline.vim
let g:airline_powerline_fonts = 1   " If iTerm2 uses patched Powerline fonts, allow them
let g:airline_theme='gruvbox'
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
" Yank WORD to system clipboard in normal mode
nmap <leader>y "+yE

" Yank selection to system clipboard in visual mode
vmap <leader>y "+y

nmap <leader>ev :tabedit $MYVIMRC<CR>

" -- Terraform --
let g:terraform_align=1
let g:terraform_fmt_on_save=1
let g:terraform_fold_sections=1

