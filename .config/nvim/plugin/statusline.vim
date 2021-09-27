set laststatus=2

set statusline=%!statusline#inactive()
augroup vimrc_statusline
  autocmd!
  autocmd WinLeave * setlocal statusline=%!statusline#inactive()
  autocmd WinEnter,BufEnter * setlocal statusline=%!statusline#active()
augroup END

"if has('nvim')
  "lua requireas('ts_statusline', 'mia.tslib', 'statusline')
"endif

function! statusline#active() abort " {{{1
  let statuslinetext  = s:modecolor()
  let statuslinetext .= statusline#mode(1)
  let statuslinetext .= ' %*'
  let statuslinetext .= statusline#dirinfo(1)
  let statuslinetext .= statusline#fileinfo(1)
  let statuslinetext .= '%='
  let statuslinetext .= statusline#temporary()
  "if has('nvim') && exists('g:loaded_nvim_treesitter')
    "let statuslinetext .= v:lua.ts_statusline()
  "endif
  let statuslinetext .= statusline#errors(1)
  let statuslinetext .= '%#stlTypeInfo#%{statusline#encoding(0)}'
  let statuslinetext .= ' %y%*'  " type info
  " let statuslinetext .= statusline#plugins(1)
  let statuslinetext .= statusline#cursorinfo(1)
  return statuslinetext
endfunction

function! statusline#inactive() abort " {{{1
  let statuslinetext  = '%#stlInactive# %4.3( %)'
  let statuslinetext .= '%{statusline#dirinfo(0)}'
  let statuslinetext .= statusline#fileinfo(0)
  let statuslinetext .= '%#stlInactive#%='
  let statuslinetext .= ' %{statusline#encoding(0)} '
  let statuslinetext .= '%y'
  let statuslinetext .= statusline#cursorinfo(0)
  return statuslinetext
endfunction

function! statusline#plugins(active) abort " {{{1
  if exists('g:loaded_obsession')
    return ObsessionStatus()
  endif
endfunction

function! statusline#temporary() abort " {{{1
  let expr = get(g:, 'stl#tmp', '')
  return !empty(expr) ? eval(expr) . ' ' : ''
endfunction

function! statusline#dirinfo(active) abort " {{{1
  " Returns: '(BRANCH)DIR/ ' or 'DIR ' or 'TERM_TITLE '
  if &filetype ==# 'help' || &buftype == 'nofile'
    return ' [DOC]'
  endif
  let statuslinetext = a:active ? '%#stlDirInfo#' : ''
  if exists('b:term_title')
    let statuslinetext .= ' ' . b:term_title . ' '
  else  " Generally, we want something like (master)dirname/
    let statuslinetext .= s:gitinfo() . ' ' . (empty(expand('%:h')) ? '' : expand('%:h') . '/')
  endif
  if a:active
    let statuslinetext .= '%*'
  endif
  return statuslinetext
endfunction

function! s:gitinfo() abort " {{{2
  " Returns: ' (BRANCH)' or ' '
  let statuslinetext = ' '
  if exists('g:loaded_fugitive') && &modifiable
    let statuslinetext .= '(' . fugitive#head() . ')'
  endif
  return statuslinetext !=# ' ()' ? statuslinetext : ' '
endfunction

function! statusline#fileinfo(active) abort " {{{1
  " Returns: 'filename modified spacer'
  let statuslinetext = '%t'
  " Should catch attention when unfocused
  if a:active
    let statuslinetext .= &modifiable ? '%#stlModified#' : ''
  endif
  let statuslinetext .= ' %m'
  let statuslinetext .= '%*'
  return statuslinetext
endfunction

function! statusline#encoding(active) " {{{1
  " Returns: 'encoding[lineendings]' in the same width as statusline#cursorinfo()
  let linedigits = float2nr(ceil(log10(line('$') + 1)))
  let stl_typeinfo = &fileformat . ' | ' . (&fileencoding ? &fileencoding : &encoding)
  "let stl_typeinfo .= repeat(' ', 14 + 2 * linedigits - len(stl_typeinfo))
  return stl_typeinfo
endfunction

function! statusline#cursorinfo(active) abort " {{{1
  " Returns: '%line/lines ☰ lineno/lines : colnum'
  let linedigits = float2nr(ceil(log10(line('$') + 1)))
  let nwid = '%' . linedigits . '.' . linedigits
  let statuslinetext = ' %3p%% '
  if a:active
    let statuslinetext .= s:modecolor()
  endif
  "let statuslinetext .= ' [' . nwid . 'l]:[%2c] (%3p%%) %*'
  let statuslinetext .= ' %3l:%-3c %*'
  return statuslinetext
endfunction

function! s:modecolor() abort " {{{1
  return get(s:modes, mode(), '%*')[0]
endfunction

let s:modes ={
      \ 'n'  : ['%#stlNormalMode#', 'N'],
      \ 'i'  : ['%#stlInsertMode#', 'I'],
      \ 'v'  : ['%#stlVisualMode#', 'V'],
      \ 'V'  : ['%#stlVisualMode#', 'V'],
      \ '' : ['%#stlVisualMode#', 'B'],
      \ 'R'  : ['%#stlReplaceMode#', 'R'],
      \ 's'  : ['%#stlSelectMode#', 'S'],
      \ 'S'  : ['%#stlSelectMode#', 'S'],
      \ '' : ['%#stlSelectMode#', 'S'],
      \ 'c'  : ['%#stlTerminalMode#', 'C'],
      \ 't'  : ['%#stlTerminalMode#', 'T'],
      \ '-'  : ['%#stlNormalMode#', '-']}

function! statusline#mode(active) abort " {{{1
  return ' ' . s:modecolor() . '%3.3( ' . get(s:modes, mode(), '-')[1] . ' %)'
endfunction

function! statusline#errors(active) abort " {{{1
  if exists('b:stl_noerr') || !a:active
    return ''
  endif

  let statuslinetext = '%#stlErrorInfo#'
  if !has('vim_starting')
    if !&modified && &modifiable && !exists('b:stl_skip_trailing_whitespace') && search('\s$', 'nw')
      let statuslinetext .= ' TRAILING WHITESPACE '
    endif

    if &modifiable && search('^\t', 'nw', line('.') + 1) && search('^  [^\s]', 'nw')
      let statuslinetext .= ' MIXED INDENT '
    endif
  endif

  " TODO: Once added to neovim, add idx for which element we're on of the list
  let statuslinetext .= len(getloclist(0)) > 0 ? ' (ll:' . len(getloclist(0)) . ') ' : ''
  let statuslinetext .= len(getqflist()) > 0 ? '(qf:' . len(getqflist()) . ')' : ''
  let statuslinetext .= '%*'
  return statuslinetext
endfunction'

" Colors {{{1
highlight stlModified ctermbg=233 ctermfg=Red cterm=bold
highlight stlTypeInfo ctermbg=233 ctermfg=Green cterm=bold
highlight stlDirInfo ctermbg=233 ctermfg=245
highlight stlErrorInfo ctermbg=Red ctermfg=White cterm=bold

highlight stlInactive ctermbg=238 ctermfg=White

highlight StatusLine ctermbg=233 ctermfg=White cterm=bold

highlight stlNormalMode ctermbg=DarkBlue ctermfg=233 cterm=bold
highlight stlInsertMode ctermbg=DarkRed ctermfg=233 cterm=bold
highlight stlVisualMode ctermbg=DarkYellow ctermfg=233 cterm=bold
highlight link stlReplaceMode stlVisualMode
highlight link stlSelectMode stlVisualMode
highlight stlTerminalMode ctermbg=DarkGreen ctermfg=233 cterm=bold