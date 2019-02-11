""" CONFIGURATION FILE FOR ASCIIDOC
"" Asciidoc
:augroup adocsnip
:    autocmd!
:    autocmd BufRead,BufNewFile *.adoc setlocal spell
:    autocmd FileType asciidoc,adoc nnoremap <buffer> <Leader>r :w<CR>:!asciidoctor-pdf %:p<CR><CR>
:    autocmd FileType asciidoc,adoc nnoremap <buffer> <Leader>w :w<CR>:!asciidoctor %:p<CR><CR>
:    autocmd FileType asciidoc,adoc nnoremap <buffer> <Leader>p :w<CR>:!asciidoctor-revealjs %:p <CR><CR>
:    autocmd FileType asciidoc,adoc nnoremap <buffer> <Leader>v :!zathura %:r.pdf &<CR><CR>
:    autocmd FileType asciidoc,adoc nnoremap <buffer> <Leader>i :!xdg-open %:r.html &<CR><CR>
:    autocmd FileType asciidoc,adoc nnoremap <buffer> ;; <Esc>/<++><Enter>ca<
:    autocmd FileType asciidoc,adoc inoremap <buffer> ;; <Esc>/<++><Enter>ca<
:    autocmd FileType asciidoc,adoc nnoremap <buffer> ;def "zyiw:!sdcv -u WordNet -n <C-r>z<CR>
:    autocmd FileType asciidoc,adoc inoremap <buffer> ;b ****<++><Esc>F*hi
:    autocmd FileType asciidoc,adoc inoremap <buffer> ;it ____<++><Esc>F_hi
:    autocmd FileType asciidoc,adoc inoremap <buffer> ;img image::{<++>}[canvas]<++><Esc>/##IMAGES##<CR>o:: <++><Esc>F:i
:    autocmd FileType asciidoc,adoc inoremap <buffer> ;t ==<Space><Enter><++><Esc>kA
:    autocmd FileType asciidoc,adoc inoremap <buffer> ;st ===<Space><Enter><++><Esc>kA
:    autocmd FileType asciidoc,adoc inoremap <buffer> ;sst ====<Space><Enter><++><Esc>kA
:    autocmd FileType asciidoc,adoc nnoremap <buffer> <Leader>f vipgq
:augroup END
