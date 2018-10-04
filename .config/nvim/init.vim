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
" load go helper
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

""" EDITOR
"
set backspace=indent,eol,start
set textwidth=79
set listchars=eol:$,tab:>-,trail:~,space:_

" tab (Recommendation x of :help tabstop)
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set shiftround
set autoindent
set smartindent

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

"" NerdTree
let g:NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

"" Airline
let g:airline_powerline_fonts = 1

"" Vim-Go
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "camelcase"
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['golint']
let g:go_auto_sameids = 1

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
" toggle list characters
nmap <silent> <Leader>; :set list!<CR>:set number!<CR>
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
" open configuration (this) file
nmap  <Leader>ocf :tabe ~/.config/nvim/init.vim<CR> 
" nerdtree mappings
nmap <silent> <Leader>x :NERDTreeToggle<CR>
nmap <silent> <Leader>h :NERDTreeFind<CR>

""" MACROS
"" General
inoremap ;; <Esc>/<++><Enter>ca<
vnoremap ;; <Esc>/<++><Enter>ca<
nnoremap ;; <Esc>/<++><Enter>ca<

" spell check for Markdown and Latex files
:augroup spellgroup
:    autocmd!
:    autocmd BufRead,BufNewFile *.md,*.tex setlocal spell
:augroup END

"" Latex
:augroup texsnip
:    autocmd!
:    autocmd BufRead,BufNewFile *.tex set filetype=tex
:    autocmd FileType plaintex,tex nnoremap <buffer> <Leader>r :w<CR>:!rubber --pdf <C-r>=maintex<CR> && pkill -HUP mupdf<CR><CR>
:    autocmd FileType plaintex,tex nnoremap <buffer> ;sm :let maintex=expand('%:t')<CR>:cd %:p:h<CR>
:    autocmd FileType plaintex,tex nnoremap <buffer> <Leader>v :!mupdf %:r.pdf &<CR><CR>
:    autocmd FileType plaintex,tex nnoremap <buffer> <Leader>f vipgq
:    autocmd FileType plaintex,tex nnoremap <buffer> ;def "zyiw:!sdcv -n <C-r>z<CR>
:    autocmd FileType plaintex,tex inoremap <buffer> ;it \textit{}<++><Esc>T{i
:    autocmd FileType plaintex,tex inoremap <buffer> ;bf \textbf{}<++><Esc>T{i
:    autocmd FileType plaintex,tex inoremap <buffer> ;ch \chapter{}<Enter><Enter><++><Esc>2kf}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;se \section{}<Enter><Enter><++><Esc>2kf}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;sse \subsection{}<Enter><Enter><++><Esc>2kf}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;sss \subsubsection{}<Enter><Enter><++><Esc>2kf}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;ref \ref{}<++><Esc>F}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;cit \cite{}<++><Esc>F}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;fot \footnote{}<++><Esc>F}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;rf Figure~\ref{fig:}<++><Esc>F}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;fig \begin{figure}<CR>\centering<CR>\includegraphics[width=0.7\textwidth]{}<CR>\caption[<++>]{<++>}<CR>\label{fig:<++>}<CR>\end{figure}<CR><++><Esc>4k$i
:    autocmd FileType plaintex,tex inoremap <buffer> ;eq \begin{equation}<CR>\label{eq:}<CR><++><CR>\end{equation}<CR><++><Esc>3k$i
":    autocmd FileType plaintex,tex inoremap <BS><BS><BS> <Esc>dbxi
:augroup END

"" Markdown
:augroup mdsnip
:    autocmd!
:    autocmd BufWritePost *.md !pandoc %:p -o %:r.pdf --template notes -V fontfamily=sans && pkill -HUP mupdf
:    autocmd BufReadPre,FileReadPre *.md !mupdf %:r.pdf &
:    autocmd FileType markdown,rmd inoremap <buffer> ;b ****<++><Esc>F*hi
:    autocmd FileType markdown,rmd inoremap <buffer> ;i **<++><Esc>F*i
:    autocmd FileType markdown,rmd inoremap <buffer> ;t #<Space><Enter><++><Esc>kA
:    autocmd FileType markdown,rmd inoremap <buffer> ;st ##<Space><Enter><++><Esc>kA
:    autocmd FileType markdown,rmd inoremap <buffer> ;sst ###<Space><Enter><++><Esc>kA
:augroup END

