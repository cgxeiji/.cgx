""" CONFIGURATION FILE FOR MARKDOWN
"" Markdown
:augroup mdsnip
:    autocmd!
:    autocmd BufRead,BufNewFile *.md setlocal spell
:    autocmd FileType markdown,rmd nnoremap <buffer> <Leader>r :w<CR>:!pandoc %:p -o %:r.pdf --template=template.latex<CR><CR>
:    autocmd FileType markdown,rmd nnoremap <buffer> <Leader>v :!zathura %:r.pdf &<CR><CR>
:    autocmd FileType markdown,rmd nnoremap <buffer> ;; <Esc>/<++><Enter>ca<
:    autocmd FileType markdown,rmd inoremap <buffer> ;; <Esc>/<++><Enter>ca<
:    autocmd FileType markdown,rmd inoremap <buffer> ;b ****<++><Esc>F*hi
:    autocmd FileType markdown,rmd inoremap <buffer> ;i **<++><Esc>F*i
:    autocmd FileType markdown,rmd inoremap <buffer> ;t #<Space><Enter><++><Esc>kA
:    autocmd FileType markdown,rmd nnoremap <buffer> ;t yypVr=
:    autocmd FileType markdown,rmd inoremap <buffer> ;st ##<Space><Enter><++><Esc>kA
:    autocmd FileType markdown,rmd nnoremap <buffer> ;st yypVr-
:    autocmd FileType markdown,rmd inoremap <buffer> ;sst ###<Space><Enter><++><Esc>kA
:    autocmd FileType markdown,rmd inoremap <buffer> ;link [](<++>)<++><Esc>F]i
:    autocmd FileType markdown,rmd nnoremap <buffer> <Leader>f vipgq
:augroup END
