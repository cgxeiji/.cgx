""" CONFIGURATION FILE FOR GDSCRIPT
"" Godot
:augroup mgsnip
:    autocmd!
:    autocmd BufRead,BufNewFile *.gd set noexpandtab
:    autocmd FileType gdscript,gd nnoremap <buffer> <Leader>r :w<CR>:!godot -u<CR>
:augroup END