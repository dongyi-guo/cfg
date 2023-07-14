
""""""""""""""""""""""
" Dongyi Guo's VimRC "
""""""""""""""""""""""

""""""""""""
" Vim Plug "
""""""""""""
" Prepare vim-plug on first set-up
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif
" Plug List 
"" Start calling plugs
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
"" Appearances
Plug 'arcticicestudio/nord-vim' " Nord
Plug 'junegunn/vim-emoji' " Emoji
"" Status Line
Plug 'vim-airline/vim-airline' " Status line
Plug 'vim-airline/vim-airline-themes' " Status line theme
"" Tools
Plug 'junegunn/goyo.vim' " Zen Mode
Plug 'preservim/nerdtree' " File Hierachy
Plug 'Xuyuanp/nerdtree-git-plugin' " Git on File Hierachy
"" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
"" Syntax Highlighting
Plug 'vim-python/python-syntax'
"" End of plug calling
call plug#end()

""""""""""""""""""""
" General Settings "
""""""""""""""""""""
syntax on " enable syntax
filetype on " enable filetype
filetype plugin indent on " enable indentation based on filetype
set novisualbell " visual cue off
set noerrorbells " sound cue off
set nobackup " back-up off
set noswapfile " swap off
set nowrap " wrap lines 
set nospell " spell check
exec "nohlsearch"
" Remeber cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif 
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set go=a
set mouse=v
color nord
set nocompatible " IMproved
set t_Co=256 " 256-color
set t_BE= " better paste
autocmd InsertLeave * set nopaste " paste in I-mode only
set lazyredraw " better macro with less re-drawing

"" Outcome
set linespace=10
set number " line number
set norelativenumber " relative line number
set ruler " cursor position
set cursorline " underline
set nolist
set autochdir 
set noshowmode
set noshowcmd 
set ttyfast
set cmdheight=1
set laststatus=0 " no status line

"" Command-mode
set wildmenu " autocomplete
set wildmode=longest,list,full " style of autocomplete
set scrolloff=3 " page-turn at %line

"" Indentation
set expandtab " always use spaces
set smarttab " smart
set tabstop=2 
set shiftwidth=2 
set backspace=2

"" Search
set hlsearch " highlight
set incsearch " incremental
set ignorecase " case-insensitve
set smartcase " smart

""""""""""""""""
" Key Bindings "
""""""""""""""""

let mapleader=" " " <LEADER> 
" Movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Buffer
map <LEADER>b
map <LEADER>B :buffers<CR>
map <LEADER>[ :bprevious<CR>
map <LEADER>] :bnext<CR>
map <LEADER>C :bdelete<CR>
map <LEADER>q :bwipeout<CR>
" Tab
map <LEADER>t :tabnew<CR>
map <LEADER>T :tabs<CR>
map <LEADER>Q :tabclose<CR>
map <LEADER>{ :tabprevious<CR>
map <LEADER>} :tabnext<CR>
" Disable highlights
map <LEADER>c :nohlsearch<CR>
" NERDTre
map <LEADER>n :NERDTreeToggle<CR>
" Goyo
map <LEADER>G :Goyo<CR>

"""""""""""""""""""
" Plugin Settings "
"""""""""""""""""""
" Airline
let g:airline_theme='nord'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

" NERDTree
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers = 0
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 0
let g:NERDTreeWinSize = 30 

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" NERDTree Git Plugin
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

" Markdown Preview
let g:mkdp_refresh_slow = 0 " Auto Refresh
let g:mkdp_command_for_global = 0 " Markdown Only
let g:mkdp_auto_start = 1 " Auto Open
let g:mkdp_auto_close = 1 " Auto Close
let g:mkdp_theme = 'dark' " Theme
let g:mkdp_page_title = '「${name}」' " Page name
let g:mkdp_filetypes = ['markdown'] " Support filetype
let g:mkdp_open_to_the_world = 1 " Open to Remote
let g:mkdp_browser = '/usr/bin/google-chrome-stable'  " Browser
let g:mkdp_open_ip = '127.0.0.1' " IP
let g:mkdp_port = '8080' " Port
let g:mkdp_echo_preview_url = 1 " Give link
" Action after browser opening
function! g:Open_browser(url)
    silent exe '!lemonade open 'a:url
endfunction
let g:mkdp_browserfunc = 'g:Open_browser'

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

"""""""""""""""
" Many thanks "
"""""""""""""""

" Luke Smith: https://github.com/LukeSmithxyz/voidrice/tree/master/.config/nvim
" durdn: https://bitbucket.org/durdn/cfg/src/a27d79339293eb55a5d96aa9aa98f92d3360471d/.nvim/init.vim#lines-71
" theniceboy: https://github.com/theniceboy/.vim/blob/master/vimrc
" craftzdong: https://github.com/craftzdog/dotfiles-public/tree/master/.config/nvim
