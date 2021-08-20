""" CONFIGURATION FILE FOR JSON
"" JSON
:augroup jsonsnip
:    autocmd!
":    autocmd BufWritePre *.json %!python3 -m json.tool 2>/dev/null || echo "Error in json. Please, undo."
:augroup END
