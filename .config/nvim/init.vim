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
" load surround option
Plugin 'tpope/vim-surround'
" load autocomplete
Plugin 'Shougo/deoplete.nvim'
" load file tree viewer
Plugin 'scrooloose/nerdtree'
" load go helper
Plugin 'fatih/vim-go'
" load R-studio
Plugin 'jalvesaq/Nvim-R'
" load Zen mode
Plugin 'junegunn/goyo.vim'
" load Python's AutoPEP8
Plugin 'tell-k/vim-autopep8'
" load Csharp Helper
Plugin 'OmniSharp/omnisharp-vim'
" load linter
Plugin 'w0rp/ale'

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
let g:deoplete#auto_complete_delay = 5
let g:deoplete#auto_refresh_delay = 30
call deoplete#custom#option('min_pattern_length', 1)
"call deoplete#custom#option('complete_method', 'omnifunc')
" OmniSharp integration
call deoplete#custom#option('sources', {
    \ 'cs': ['omnisharp'],
    \ })

"" OmniSharp
let g:OmniSharp_highlight_types = 1
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_timeout = 5
set completeopt+=longest,menuone,preview
let g:omnicomplete_fetch_full_documentation = 1

"" ALE
let g:ale_linters = {
    \ 'cs': ['OmniSharp']
    \}
let g:ale_fixers = {
            \ 'cs': ['uncrustify', 'remove_trailing_lines'],
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \}
let g:ale_fix_on_save = 1
let g:ale_cs_mcsc_assemblies = [
            \ 'MonoGame.Framework.dll',
            \]

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

"" Auto PEP8
" Auto PEP8 on save of Python files
:augroup pygroup
:    autocmd!
:    autocmd BufRead,BufNewFile *.py let g:autopep8_on_save = 1
:    autocmd BufRead,BufNewFile *.py let g:autopep8_disable_show_diff = 1
:
:    autocmd BufRead,BufNewFile *.py let g:python_highlight_all = 1
:    autocmd BufRead,BufNewFile *.py let g:python_slow_sync = 0
:augroup END

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
" move through visual lines
map <Up> gk
map <Down> gj
" search for spaces
cnoremap <expr><space> '/?' =~ getcmdtype() ? '\_s*' : ' '

"" File Manager
" open file in new tab
nmap  <Leader>ot :tabe<Space>
" open file in vertical split
nmap  <Leader>ov :vsplit<Space>
" open file in horizontal split
nmap  <Leader>oh :split<Space>
" open configuration (this) file
nmap  <Leader>ocf :tabe ~/.config/nvim/init.vim<CR>
" nerdtree mappings
nmap <silent> <Leader>x :NERDTreeToggle<CR>
nmap <silent> <Leader>h :NERDTreeFind<CR>
" zen mode
nmap <silent> <Leader>F :Goyo<CR>

""" MACROS
"" General
"inoremap <Leader>, <Esc>/<++><Enter>ca<
vnoremap <Leader>, <Esc>/<++><Enter>ca<
nnoremap <Leader>, <Esc>/<++><Enter>ca<

inoremap <C-h> <C-x><C-o>

" spell check for Markdown and Latex files
:augroup spellgroup
:    autocmd!
:    autocmd BufRead,BufNewFile *.md,*.tex setlocal spell
:augroup END

"" Latex
:augroup texsnip
:    autocmd!
:    autocmd BufRead,BufNewFile *.tex set filetype=tex
:    autocmd FileType plaintex,tex nnoremap <buffer> <Leader>r :w<CR>:!rubber --unsafe --pdf <C-r>=maintex<CR>&<CR><CR>
:    autocmd FileType plaintex,tex nnoremap <buffer> <Leader>c :w<CR>:!rubber --clean <C-r>=maintex<CR>&<CR><CR>
:    autocmd FileType plaintex,tex nnoremap <buffer> ;sm :let maintex=expand('%:t')<CR>:cd %:p:h<CR>
:    autocmd FileType plaintex,tex nnoremap <buffer> ;; <Esc>/<++><Enter>ca<
:    autocmd FileType plaintex,tex inoremap <buffer> ;; <Esc>/<++><Enter>ca<
:    autocmd FileType plaintex,tex nnoremap <buffer> <Leader>v :!zathura %:r.pdf &<CR><CR>
:    autocmd FileType plaintex,tex nnoremap <buffer> <Leader>f gqap
:    autocmd FileType plaintex,tex nnoremap <buffer> ;def "zyiw:!sdcv -u WordNet -n <C-r>z<CR>
:    autocmd FileType plaintex,tex inoremap <buffer> ;it \textit{}<++><Esc>T{i
:    autocmd FileType plaintex,tex inoremap <buffer> ;bf \textbf{}<++><Esc>T{i
:    autocmd FileType plaintex,tex inoremap <buffer> ;key \keyword{}<++><Esc>T{i
:    autocmd FileType plaintex,tex inoremap <buffer> ;su \textsubscript{}<++><Esc>T{i
:    autocmd FileType plaintex,tex inoremap <buffer> ;ch \chapter{}<Enter><Enter><++><Esc>2kf}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;se \section{}<Enter><Enter><++><Esc>2kf}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;sse \subsection{}<Enter><Enter><++><Esc>2kf}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;sss \subsubsection{}<Enter><Enter><++><Esc>2kf}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;ref \ref{}<++><Esc>F}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;cit ~\cite{}<++><Esc>F}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;fot \footnote{}<++><Esc>F}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;rf Figure~\ref{fig:}<++><Esc>F}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;fso \small\raggedleft\textit{Source: }<Esc>i
:    autocmd FileType plaintex,tex inoremap <buffer> ;rc Chapter~\ref{cha:}<++><Esc>F}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;rse Section~\ref{se:}<++><Esc>F}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;rss Subsection~\ref{sse:}<++><Esc>F}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;fig \begin{figure}<CR>\centering<CR>\includegraphics[width=0.7\textwidth]{}<CR>\caption[<++>]{<++>}<CR>\label{fig:<++>}<CR>\small\raggedleft\textit{Source: <++>}<CR>\end{figure}<CR><++><Esc>5k$i
:    autocmd FileType plaintex,tex inoremap <buffer> ;eq \begin{equation}<CR>\label{eq:}<CR><++><CR>\end{equation}<CR><++><Esc>3k$i
:    autocmd FileType plaintex,tex inoremap <buffer> ;enum \begin{enumerate}[noitemsep]<CR>\item <CR><++><CR>\end{enumerate}<CR><++><Esc>3k$a
:    autocmd FileType plaintex,tex inoremap <buffer> ;item \begin{itemize}[noitemsep]<CR>\item <CR><++><CR>\end{itemize}<CR><++><Esc>3k$a
:    autocmd FileType plaintex,tex inoremap <buffer> ;ii \item <CR><++><Esc>k$a
:    autocmd FileType plaintex,tex inoremap <buffer> ;lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sollicitudin dolor ut condimentum ornare. Nullam eu risus justo. Fusce in tempus nibh, nec bibendum erat. In hac habitasse platea dictumst. Donec sodales hendrerit molestie. Maecenas porta efficitur dolor, eu scelerisque libero gravida id. Vestibulum non urna molestie, pellentesque elit a, luctus est. Integer dapibus est congue mi ultricies, ac venenatis lectus malesuada. Nunc nisl est, faucibus non varius nec, suscipit eu neque. Nulla arcu dolor, fringilla ut porttitor quis, ullamcorper et metus. Etiam tempor hendrerit justo a vulputate. Pellentesque bibendum ipsum sed ex tempus ultricies. Suspendisse interdum eros orci, a.
":    autocmd FileType plaintex,tex inoremap <BS><BS><BS> <Esc>dbxi
:augroup END

"" Markdown
:augroup mdsnip
:    autocmd!
:    autocmd FileType markdown,rmd nnoremap <buffer> <Leader>r :w<CR>:!pandoc %:p -o %:r.pdf --template notes -V fontfamily=sans<CR><CR>
:    autocmd FileType markdown,rmd nnoremap <buffer> ;; <Esc>/<++><Enter>ca<
:    autocmd FileType markdown,rmd inoremap <buffer> ;; <Esc>/<++><Enter>ca<
:    autocmd FileType markdown,rmd inoremap <buffer> ;b ****<++><Esc>F*hi
:    autocmd FileType markdown,rmd inoremap <buffer> ;i **<++><Esc>F*i
:    autocmd FileType markdown,rmd inoremap <buffer> ;t #<Space><Enter><++><Esc>kA
:    autocmd FileType markdown,rmd inoremap <buffer> ;st ##<Space><Enter><++><Esc>kA
:    autocmd FileType markdown,rmd inoremap <buffer> ;sst ###<Space><Enter><++><Esc>kA
:    autocmd FileType markdown,rmd inoremap <buffer> ;link [](<++>)<++><Esc>F]i
:    autocmd FileType markdown,rmd nnoremap <buffer> <Leader>f vipgq
:augroup END

"" MonoGame
:augroup mgsnip
:    autocmd!
:    autocmd FileType cs nnoremap <buffer> <Leader>r :w<CR>:!mono "$(mdtool build <Bar> grep -oe "/home.*exe")" <CR>
:    autocmd FileType cs nnoremap <buffer> <Leader>i :OmniSharpDocumentation<CR>
:augroup END
