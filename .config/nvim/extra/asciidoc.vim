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
:    autocmd FileType asciidoc,adoc nnoremap <buffer> <Leader>tr :0r !cat ~/.cgx/.config/nvim/extra/template_revealjs.adoc<CR>gg/<++><CR>ca<
:    autocmd FileType asciidoc,adoc nnoremap <buffer> ;; <Esc>/<++><Enter>ca<
:    autocmd FileType asciidoc,adoc inoremap <buffer> ;; <Esc>/<++><Enter>ca<
:    autocmd FileType asciidoc,adoc nnoremap <buffer> ;def "zyiw:!sdcv -u WordNet -n <C-r>z<CR>
:    autocmd FileType asciidoc,adoc inoremap <buffer> ;b **<++><Esc>F*i
:    autocmd FileType asciidoc,adoc inoremap <buffer> ;it __<++><Esc>F_i
:    autocmd FileType asciidoc,adoc inoremap <buffer> ;ifp ifdef::backend-revealjs[]<CR><CR>endif::backend-revealjs[]<Up>
:    autocmd FileType asciidoc,adoc inoremap <buffer> ;ifr ifdef::backend-pdf[]<CR><CR>endif::backend-pdf[]<Up>
:    autocmd FileType asciidoc,adoc inoremap <buffer> ;img image::{<++>}[canvas, size=contain]<Esc>/##IMAGES##<CR>o:img-: <++><Esc>F:i
:    autocmd FileType asciidoc,adoc inoremap <buffer> ;not [NOTE.speaker]<CR>--<CR><CR>--<Up>
:    autocmd FileType asciidoc,adoc inoremap <buffer> ;t ==<Space><Enter><++><Esc>kA
:    autocmd FileType asciidoc,adoc inoremap <buffer> ;st ===<Space><Enter><++><Esc>kA
:    autocmd FileType asciidoc,adoc inoremap <buffer> ;sst ====<Space><Enter><++><Esc>kA
:    autocmd FileType asciidoc,adoc nnoremap <buffer> <Leader>f vipgq
:augroup END
