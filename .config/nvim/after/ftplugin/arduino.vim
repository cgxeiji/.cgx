""" CONFIGURATION FILE FOR ARDUINO
"" Arduino
:augroup arduino
:    autocmd!
:    autocmd BufRead,BufNewFile *.ino let g:airline_section_x='%{ArduinoStatusLine()}'
:    autocmd FileType arduino,ino nnoremap <buffer> <Leader>r :w<CR>:ArduinoUpload<CR>
:augroup END
