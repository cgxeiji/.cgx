""" CONFIGURATION FILE FOR GDSCRIPT
"" Godot
:augroup gdsnip
:    autocmd!
:    autocmd BufRead,BufNewFile *.gd set noexpandtab
:    autocmd FileType gdscript,gd,gdscript3 nnoremap <buffer> <Leader>r :w<CR>:!godot -s % --check-only<CR>
:augroup END
