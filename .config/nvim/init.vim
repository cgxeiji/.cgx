""" LOAD PLUGINS
filetype off

set rtp +=~/.cgx/.config/nvim/bundle/Vundle.vim
call vundle#begin()

" load plugin manager
Plugin 'gmarik/vundle'

" load colorscheme
Plugin 'tomasr/molokai'
" load pretty status line
Plugin 'vim-airline/vim-airline'
" load autocomplete
Plugin 'Shougo/deoplete.nvim'
" load file tree viewer
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on

""" EDITOR
"
set backspace=indent,eol,start
set textwidth=79

" tab (Recommendation 1 of :help tabstop)
set softtabstop=4
set shiftwidth=4
set noexpandtab
set shiftround

" fold
setlocal foldmethod=syntax
set nofoldenable

" search
set ignorecase
set smartcase
set magic

" screen
set lazyredraw
set showmatch
set splitbelow
set splitright

" terminal
let base16colorspace=256
set t_Co=256
set background=dark
colorscheme molokai
set encoding=utf8

""" PLUGINS SETTINGS
"" Deoplete
let g:deoplete#enable_at_startup = 1

"" Airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" powerline
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

""" KEYBINDIGS
"
" leader
let mapleader = " "

"" Edition
" remove search highlighting
nmap <silent> <Leader><Leader> :noh<cr>
" (s)ave current file
nmap <silent> <Leader>s :w<cr>
" (z)oom in current pane
nmap <silent> <Leader>z :wincmd \|<CR> :wincmd _<CR>
" (a)ll panes equal size
nmap <silent> <Leader>a :wincmd =<CR>
" (t)ab to next pane
nmap <silent> <Leader>t :wincmd w<CR>
" (q)uit current file
nmap <silent> <Leader>q :q<CR>
" ESC from home row
imap kj <ESC>

"" File Manager
" open file in new tab
nmap  <Leader>ot :tabe 
" open file in vertical split
nmap  <Leader>ov :vsplit  
" open file in horizontal split
nmap  <Leader>oh :split 
