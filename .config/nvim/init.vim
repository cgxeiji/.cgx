""" LOAD PLUGINS
filetype off

set rtp +=~/.cgx/.config/nvim/bundle/Vundle.vim
set rtp +=~/.cgx/.config/nvim/
set rtp +=/usr/local/opt/fzf
call vundle#begin()

" load plugin manager
Plugin 'gmarik/vundle'

" load colorscheme
Plugin 'tomasr/molokai'
" load pretty status line
" Plugin 'vim-airline/vim-airline'
" load surround option
Plugin 'tpope/vim-surround'
" load autocomplete
Plugin 'Shougo/deoplete.nvim'
" load fuzzy search
Plugin 'junegunn/fzf.vim'
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
" load Godot integration
Plugin 'habamax/vim-godot'
" load undotree
Plugin 'mbbill/undotree'
" load unimpaired
Plugin 'tpope/vim-unimpaired'
" load fugitive
Plugin 'tpope/vim-fugitive'
" load tabular
Plugin 'godlygeek/tabular'
" load UltiSnips
Plugin 'SirVer/ultisnips'
" load snippets
Plugin 'honza/vim-snippets'
" load signature
Plugin 'kshenoy/vim-signature'
" load csv
Plugin 'chrisbra/csv.vim'
" load polyglot
Plugin 'sheerun/vim-polyglot'
" load Arduino snippets
Plugin 'sudar/vim-arduino-snippets'
" load Arduino helper
Plugin 'stevearc/vim-arduino'
" load Colorizer
Plugin 'chrisbra/Colorizer'
" load Emmet
Plugin 'mattn/emmet-vim'
" load matchit
Plugin 'tmhedberg/matchit'
" load coloresque
Plugin 'gko/vim-coloresque'
" load ejs syntax
Plugin 'nikvdp/ejs-syntax'
" load autoformat
Plugin 'Chiel92/vim-autoformat'
" load eunuch
Plugin 'tpope/vim-eunuch'

call vundle#end()
filetype plugin indent on
syntax on

""" EDITOR
"
set backspace=indent,eol,start
set textwidth=79
set listchars=tab:>-,trail:~
set list
set hidden
set undofile
set inccommand=nosplit
set title
set eadirection="hor"
set scrolloff=999

" japanese
"set formatoptions+=mM
"set ambiwidth=double
"set display+=lastline
set matchpairs+=「:」,（:）,【:】

" tab (Recommendation x of :help tabstop)
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set shiftround
set autoindent
"set smartindent

" fold
setlocal foldmethod=syntax
set foldenable
set foldcolumn=4
setlocal foldlevelstart=99

function! FoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth
    let n_lines = v:foldend - v:foldstart + 1
    let n_lines_text = printf("[ %3s lines ]", n_lines)

    let endline = substitute(getline(v:foldend), '^\s*"\?\s*\|\s*"\?s*{{' . '{\d*\s*', '', 'g')
    " expand tabs into spaces
    let onetab = strpart('>---', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g') . ' »»» ' . endline . ' |'

    let line = strpart(line, 0, windowwidth - 2 - len(n_lines))
    let fillcharcount = windowwidth - len(line) - len(n_lines_text) + 2
    return line . repeat("÷",fillcharcount) . n_lines_text . ' '
endfunction
set foldtext=FoldText()

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
"let base16colorspace=256
" set t_Co=256
set background=dark
colorscheme molokai
set encoding=utf8

:augroup recolor
:   autocmd!
:   autocmd ColorScheme * highlight Visual cterm=reverse
:   autocmd ColorScheme * highlight Folded ctermfg=0 ctermbg=NONE
:   autocmd ColorScheme * highlight FoldColumn cterm=bold ctermfg=0 ctermbg=232
:augroup END

highlight Visual cterm=reverse
highlight Folded ctermfg=0 ctermbg=NONE
highlight FoldColumn cterm=bold ctermfg=0 ctermbg=232

:augroup foldcol
:   autocmd!
:   autocmd InsertEnter * highlight FoldColumn ctermfg=232
:   autocmd InsertLeave * highlight FoldColumn ctermfg=0
:augroup END

":augroup foldcol
":   autocmd!
":   autocmd BufWritePre ?* mkview | filetype detect
":   autocmd BufReadPost ?* silent! loadview | filetype detect
":augroup END

:augroup vimconfig
:   autocmd!
:   autocmd BufWritePost $MYVIMRC source % | echom "Sourced " . $MYVIMRC
:augroup END

fun! FindTagsFileInGitDir(file)
  let path = fnamemodify(a:file, ':p:h')
  while path != '/'
    let fname = path . '/.git/tags'
    if filereadable(fname)
      silent! exec 'set tags+=' . fname
    endif
    let path = fnamemodify(path, ':h')
  endwhile
endfun

:augroup CtagsGroup
:  autocmd!
:  autocmd BufRead * call FindTagsFileInGitDir(expand("<afile>"))
:augroup END

""" PLUGINS SETTINGS
"" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
    \ 'auto_complete_delay': 5,
    \ 'auto_refresh_delay': 30,
    \ 'min_pattern_length': 1,
\ })
"call deoplete#custom#option('complete_method', 'omnifunc')
" OmniSharp integration
call deoplete#custom#option('sources', {
    \ 'cs': ['omnisharp'],
    \ })

"" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"

"" OmniSharp
let g:OmniSharp_highlight_types = 1
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_timeout = 5
set completeopt+=longest,menuone,preview
let g:omnicomplete_fetch_full_documentation = 1

"" ALE
let g:ale_linters = {
    \ 'cs': ['OmniSharp'],
    \ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'tex': ['chktex']
    \}
let g:ale_fixers = {
            \ 'cs': ['uncrustify', 'remove_trailing_lines'],
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \}
let g:ale_fix_on_save = 1
let g:ale_cs_mcsc_assemblies = [
            \ 'MonoGame.Framework.dll',
            \]

augroup remotes
    autocmd!
    autocmd BufRead,BufNew ~/remotes/**/* ALEDisableBuffer
augroup END

"" NerdTree
let g:NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

"" FZF
let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

" Rg with preview window
command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%', '?'),
    \   <bang>0)

" layout
let g:fzf_layout = { 'down': '~40%' }

" Files with
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"" Airline
let g:airline_powerline_fonts = 1

"" Goyo
let g:goyo_width = 81

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
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "camelcase"
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['golint']
let g:go_auto_sameids = 0
let g:go_auto_type_info = 1
set updatetime=100

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"" Auto PEP8
" Auto PEP8 on save of Python files
:augroup pygroup
:    autocmd!
:    autocmd BufRead,BufNewFile *.py let g:autopep8_on_save = 1
:    autocmd BufRead,BufNewFile *.py let g:autopep8_disable_show_diff = 1
:    autocmd BufRead,BufNewFile *.py let g:autopep8_ignore = "E226,E24,W6,E402"
:
:    autocmd BufRead,BufNewFile *.py let g:python_highlight_all = 1
:    autocmd BufRead,BufNewFile *.py let g:python_slow_sync = 0
:    autocmd BufRead,BufNewFile *.py set textwidth=0
:    autocmd FileType python,py nnoremap <buffer> <Leader>r :w<CR>:!python %:r.py<CR>
:augroup END

"" Arduino
function! ArduinoStatusLine()
  let port = arduino#GetPort()
  let line = '%f [' . g:arduino_board . '] [' . g:arduino_programmer . ']'
  if !empty(port)
    let line = line . ' (' . port . ':' . g:arduino_serial_baud . ')'
  endif
  return line
endfunction

"" EJS
:augroup ejsgroup
:   autocmd!
:   autocmd BufRead,BufNewFile *.ejs set filetype=ejs.html
:augroup END

"" JSX
:augroup jsxgroup
:   autocmd!
:   autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact.html
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
nmap <silent> <Leader>; :set number!<CR>:set relativenumber!<CR>
" (s)ave current file
nmap <silent> <Leader>s :w<cr>
" (z)oom in current pane
nmap <silent> <Leader>z :wincmd \|<CR> :wincmd _<CR>
" (a)ll panes equal size
nmap <silent> <Leader>a :wincmd =<CR>
" (t)ab to next pane
nmap <silent> <Leader>t :wincmd w<CR>
" switch to (b)uffer
nmap <silent> <Leader>B :ls<CR>:b<Space>
nmap <silent> <tab> <C-^>
" (q)uit current window
nmap <silent> <Leader>q :q<CR>
" toggle (u)ndo tree
nmap <silent> <Leader>u :UndotreeToggle<CR>
" (g)et (t)ODOs
nmap <silent> <Leader>gt :copen<CR>:silent grep TODO -r .<CR>
" ESC from home row
imap kj <ESC>
" move through visual lines
map <Up> gk
map <Down> gj
" resize panes
nnoremap <silent> <C-Left> <C-w><
nnoremap <silent> <C-Right> <C-w>>
nnoremap <silent> <C-Down> <C-w>+
nnoremap <silent> <C-Up> <C-w>+
nnoremap <silent> <C-Down> <C-w>-
" move through windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" search for spaces
cnoremap <expr><space> '/?' =~ getcmdtype() ? '\_s*' : ' '

"" Terminal
" remap Esc
tnoremap <Leader><Esc> <C-\><C-n>

"" File Manager
" open file in new tab
nmap  <Leader>ot :tabe<Space>
" open file in vertical split
nmap  <Leader>ov :vsplit<Space>
" open file in horizontal split
nmap  <Leader>oh :split<Space>
" open file in current window
nmap  <Leader>oe :Rg<CR>
" open configuration (this) file
nmap  <Leader>ocf :vs $MYVIMRC<CR>
" nerdtree mappings
nmap <silent> <Leader>x :NERDTreeToggle<CR>
nmap <silent> <Leader>h :NERDTreeFind<CR>
" zen mode
nmap <silent> <Leader>F :Goyo<CR>
" navigation
nmap  H ^
nmap  L $

""" MACROS
"" General
"inoremap <Leader>, <Esc>/<++><Enter>ca<
vnoremap <Leader>, <Esc>/<++><Enter>ca<
nnoremap <Leader>, <Esc>/<++><Enter>ca<

inoremap <C-h> <C-x><C-o>

highlight Normal ctermbg=NONE
