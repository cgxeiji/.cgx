""" CONFIGURATION FILE FOR GDSCRIPT
"" Godot
:augroup gdsnip
:    autocmd!
:    autocmd BufRead,BufNewFile *.gd set noexpandtab
:    autocmd FileType gdscript,gd,gdscript3 nnoremap <buffer> <Leader>r :w<CR>:!godot -s % --check-only<CR>
:augroup END

" check:
" http://learnvimscriptthehardway.stevelosh.com/chapters/49.html
" for more information on the functions.
function! GDScriptFolds()
	let line = getline(v:lnum)
	if line =~? "^[\s}]*$"
		if getline(v:lnum-1) =~? "^[\s}]*$"
			return 0
		endif
		return "="
	endif

	let current_indent = IndentLevel(v:lnum)
	let next_indent = IndentLevel(NextNonBlankLine(v:lnum))

	if next_indent == current_indent
		return current_indent
	elseif next_indent > current_indent
		return '>' . next_indent
	elseif next_indent < current_indent
		return current_indent
	endif

	return "="
endfunction

function! IndentLevel(lnum)
	return indent(a:lnum) / &shiftwidth
endfunction

function! NextNonBlankLine(lnum)
	let nlines = line('$')
	let current = a:lnum + 1

	while current <= nlines
		if getline(current) =~ '\v\S'
			return current
		endif

		let current += 1
	endwhile

	return -2
endfunction

setlocal foldmethod=expr
setlocal foldexpr=GDScriptFolds()
setlocal foldlevelstart=99

nnoremap <buffer> K gUiwyiwu:Man godotengine<CR>/^<C-r>"$<CR>zt:nohlsearch<CR>
