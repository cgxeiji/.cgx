""" CONFIGURATION FILE FOR ARDUINO
"" Arduino
:augroup arduino
:    autocmd!
:    autocmd FileType arduino,ino nnoremap <buffer> <Leader>r :w<CR>:!~/.cgx/.scripts/arduino_upload.sh<CR>
:augroup END
