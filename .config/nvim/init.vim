" Dongyi's neovim Config

" Many thanks to:
" Luke Smith: https://github.com/LukeSmithxyz/voidrice/tree/master/.config/nvim
" durdn: https://bitbucket.org/durdn/cfg/src/a27d79339293eb55a5d96aa9aa98f92d3360471d/.nvim/init.vim#lines-71
" theniceboy: https://github.com/theniceboy/.vim/blob/master/vimrc
" craftzdong: https://github.com/craftzdog/dotfiles-public/tree/master/.config/nvim

" Prepare vim-plug
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Vim-Plug
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

" Appearances
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-emoji'

" Status Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Tools
Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Syntax Highlighting
Plug 'junegunn/vim-emoji'
Plug 'vim-python/python-syntax'
call plug#end()

""""""""""""""""""
" Start Settings "
""""""""""""""""""

" Base
syntax on 
filetype on " tell filetype
filetype plugin indent on " indent based on filetype
set go=a
set mouse=v
exec "nohlsearch"
color nord
let mapleader=" " " mod key Space
set wrap " wrap lines 
set spell " spell check
set nocompatible " IMproved
set novisualbell " visual cue off
set noerrorbells " sound cue off
set nobackup " back-up off
set noswapfile " swap off
set t_Co=256 " 256-color
set t_BE= " better paste
autocmd InsertLeave * set nopaste " paste in I-mode only
set lazyredraw " better macro with less re-drawing
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif " remember cursor position

" Outcome
set linespace=10
set number " line number
set relativenumber " relative line number
set noruler
set cursorline " underline
set nolist
set autochdir 
set noshowmode
set noshowcmd 
set ttyfast
set cmdheight=1
set laststatus=0 " no status line

" Command-mode
set wildmenu " autocomplete
set wildmode=longest,list,full " style of autocomplete
set scrolloff=5 " page-turn at %line

"" Indentation
set expandtab " always use spaces
set smarttab " smart
""" Tab = 2
set tabstop=2 
set shiftwidth=2 
set backspace=2

"" Move Focus
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"" Search
map <LEADER>n :nohlsearch<CR>
set hlsearch " highlight
set incsearch " incremental
set ignorecase " case-insensitve
set smartcase " smart

"""""""""""""""""""
" PLUGIN SETTINGS "
"""""""""""""""""""

" Airline
let g:airline_theme='nord'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'

" NerdTree
map <C-n> :NERDTreeToggle<CR> 
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers = 0
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 50 

" Fancy way to escape
:imap ii <Esc>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Close if no file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Automatically open with blanks
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Automatically open with directories
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Git Plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "C",
    \ "Staged"    : "S",
    \ "Untracked" : "U",
    \ "Renamed"   : "R",
    \ "Unmerged"  : "D",
    \ "Deleted"   : "X",
    \ "Dirty"     : "T",
    \ "Clean"     : "G",
    \ "Ignored"   : "I",
    \ "Unknown"   : "?"
    \ }
