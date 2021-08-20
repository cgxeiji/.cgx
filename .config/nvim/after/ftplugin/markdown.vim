if exists("b:did_ftplugin")
    finish
endif

""" CONFIGURATION FILE FOR MARKDOWN
"" Markdown
setlocal spell

nnoremap <buffer> <Leader>r :w<CR>:!pandoc %:p -o %:r.pdf --template eisvogel --listings --pdf-engine xelatex &<CR><CR>
nnoremap <buffer> <Leader>v :!zathura %:r.pdf &<CR><CR>
nnoremap <buffer> ;; <Esc>/<++><Enter>ca<
nnoremap <buffer> ;def "zyiw:!sdcv -u WordNet -n <C-r>z<CR>
inoremap <buffer> ;; <Esc>/<++><Enter>ca<
inoremap <buffer> ;b ****<++><Esc>F*hi
inoremap <buffer> ;i **<++><Esc>F*i
inoremap <buffer> ;t #<Space><Enter><++><Esc>kA
nnoremap <buffer> ;t yypVr=
inoremap <buffer> ;st ##<Space><Enter><++><Esc>kA
nnoremap <buffer> ;st yypVr-
inoremap <buffer> ;sst ###<Space><Enter><++><Esc>kA
inoremap <buffer> ;link [](<++>)<++><Esc>F]i
nnoremap <buffer> <Leader>f vipgq
nnoremap <buffer> <Leader>jap :setlocal formatoptions+=mM<CR>:setlocal ambiwidth=double<CR>:setlocal display+=lastline<CR>
