""" CONFIGURATION FILE FOR C#
"" MonoGame
:augroup mgsnip
:    autocmd!
:    autocmd FileType cs nnoremap <buffer> <Leader>r :w<CR>:!mono "$(mdtool build <Bar> grep -oe "/home.*exe")" <CR>
:    autocmd FileType cs nnoremap <buffer> <Leader>i :OmniSharpDocumentation<CR>
:augroup END
