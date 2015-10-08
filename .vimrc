" Author: 	Ulli Goschler <ulligoschler@gmail.com>
" Created: 	Sun, 26.04.2009 - 19:52:23
" Modified: Fri, 02.10.2015 - 16:29:58
"
" Vundle Install
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin  'VundleVim/Vundle.vim' 
Plugin 	'altercation/vim-colors-solarized' 	" Solarized Colorscheme
Plugin 	'Timestamp.vim'
Plugin  'openssl.vim'
Plugin 	'bling/vim-airline' 				" Airline as Statusline
"Plugin 	'edkolev/tmuxline.vim'				" Tmux Statusline Generation with Airlinesupport
Plugin 'chriskempson/base16-vim'			" Base16 Colorscheme
Plugin 	'christoomey/vim-tmux-navigator' 	" Seamlessly navigate through panes/splits with same vim binding
Plugin 	'tpope/vim-fugitive' 				" Git Support
Plugin  'tpope/vim-surround' 				" Edit surroundings of text objects
Plugin  'tpope/vim-commentary' 				" Edit comments of things
Plugin  'tpope/vim-repeat'	 				" Enable plugin repeating with .
Plugin 	'scrooloose/syntastic'				" Syntastic Syntax checking
call vundle#end() 		" Required
filetype plugin indent on 	" Required

set noshowmode 			" Don't display Insert/Visual Mode on Bottom; Done with airline
set laststatus=2 		" Display a status Line 
set modeline 			" Allow file specific vim settings

set mouse=a
set number				" Show Absolute Line Numbers in Current Line
set relativenumber		" Show Relative Line Numbers

syntax enable 			" Syntax Highlighting
set background=dark
"let g:solarized_termcolors=256 		" Let Solarized use 256 Colors
"colorscheme solarized
"let base16colorspace=256
colorscheme base16-flat

let mapleader=","         " Define  leader Key " Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Show whitespace
set list
set listchars=eol:⌐,tab:⋅⋅,trail:~,extends:>,precedes:<
"hi NonText ctermfg=23
"hi SpecialKey ctermbg=8 ctermfg=10

" Trim trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

set encoding=utf-8
set fileencoding=utf-8
set backspace=2 		" Fixed Backspace issue on older Systems
set scrolloff=5 		" Scroll when Screen end is in 5 lines
set clipboard=unnamed	" Use system clipboard

set ignorecase 			" Ignore case on matching
set smartcase			" But only when search is all lower case
set incsearch 			" Incremental searching
set hlsearch 			" Highlight matches

" --- Tabs ---
set noexpandtab 		" Don't insert Spaces for tabs
"set autoindent 			" Copy indent from current line to new one
set smartindent 		" Ident newlines
set tabstop=4 			" How many spaces should be DISPLAYED as one tab
set shiftwidth=0		" How many spaces should be INSERTED as one tab; If set to '0', it uses tabstop value as default

autocmd Filetype python setlocal noexpandtab tabstop=4 shiftwidth=4

set formatoptions+=rco 		" t - autowrap to textwidth 
							" c - autowrap comments to textwidth 
			j				" r - autoinsert comment leader with <Enter>
							" q - allow formatting of comments with :gq

highlight OverLength ctermbg=red ctermfg=white ctermbg=darkred
match OverLength /\%81v.\+/

inoremap <F6> # <C-R>=getcwd()<CR>i/<C-R>%<CR>Author:	Ulli Goschler <ulligoschler@gmail.com><CR>Created:	<ESC>"=strftime("%a, %d.%m.%Y - %H:%M:%S ")<CR>p<ESC>oModified:	Tue, 01.01.1970 - 13:37:00<CR>


" --- Text writing --- 
let g:tex_flavor='latex'
au FileType tex set digraph                     " Fancy utf8 representations
au FileType tex setlocal spell spelllang=de     " german spellchecking on latex files
let g:tex_comment_nospell=1                     " but not on comments

" --- Plugins ---
" Timestamp.vim
let timestamp_regexp = '\v\C%(<(Last )?%([cC]hanged?|[Mm]odified):\s+)@<=.*$'  
let g:timestamp_rep = '%a, %d.%m.%Y - %H:%M:%S'
let g:timestamp_modelines = 8
" Airline.vim
let g:airline_powerline_fonts = 1 	" If iTerm2 uses patched Powerline fonts, allow them 
"let g:airline_theme='powerlineish'
let g:airline_theme='papercolor'
" Show a short mode in the Statusline 
let g:airline_mode_map = {
	\ 'n' : 'N' ,
	\ 'i' : 'I' ,
	\ 'v' : 'V' ,
	\ 'R' : 'R' ,
	\ }
let g:airline_section_y = airline#section#create(['%{v:servername}'])	" Remove tagbar, filetype, virtualenv, add servername
let g:airline_section_x = ''		
" Dirciple
" https://www.reddit.com/r/vim/comments/3lywog/this_is_what_my_macvim_workflow_looks_like_what/cvcuw4o
" Highlight the window, for use with dirciple
function HighlightWindow()
  "hi LineNr ctermfg=black ctermbg=2
  "hi CursorLineNr ctermfg=black ctermbg=lightgreen
  "redraw
endfunction

function UnHighlightWindow()
  " The following line is another custom thing I built that changes my background between light and dark.
  " I commented it out because it won't work for you

  " call Setbackground()

  " I think the following lines should work instead for reverting the gutter color, otherwise you may need
  " to do it manually with similar syntax to what is in the HighlightWindow function
  " You can change dark to light depending on your theme
  "exe "hi! LineNr"         .s:fmt_none   .s:fg_base01 .s:bg_base02
  "exe "hi! CursorLine"     .s:fmt_uopt   .s:fg_none   .s:bg_base02  .s:sp_base1
  "set background=dark
  "hi LineNr ctermfg=yellow ctermbg=gray
  "hi CursorLineNr ctermfg=blue ctermbg=gray
  "redraw
endfunction
