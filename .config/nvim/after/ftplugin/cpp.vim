if exists("b:did_ftplugin")
    finish
endif

""" CONFIGURATION FILE FOR C++
"" openFrameworks
nnoremap <buffer> <Leader>r :w<CR>:make -j 24 && make run<CR>
