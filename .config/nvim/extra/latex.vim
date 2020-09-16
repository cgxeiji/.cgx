""" CONFIGURATION FILE FOR LATEX
"" Latex
:augroup texsnip
:    autocmd!
:    autocmd BufRead,BufNewFile *.tex set filetype=tex
:    autocmd BufRead,BufNewFile *.tex setlocal spell
:    autocmd FileType plaintex,tex nnoremap <buffer> <Leader>r :w<CR>:!rubber --unsafe --pdf --module xelatex <C-r>=maintex<CR><CR>
:    autocmd FileType plaintex,tex nnoremap <buffer> <Leader>c :w<CR>:!rubber --clean <C-r>=maintex<CR>&<CR><CR>
:    autocmd FileType plaintex,tex nnoremap <buffer> <Leader>d :w<CR>:!latexdiff old.tex <C-r>=maintex<CR> > diff.tex && rubber --unsafe --pdf diff.tex &<CR><CR>
:    autocmd FileType plaintex,tex nnoremap <buffer> ;sm :let maintex=expand('%:t')<CR>:cd %:p:h<CR>
:    autocmd FileType plaintex,tex nnoremap <buffer> ;; <Esc>/<++><Enter>ca<
:    autocmd FileType plaintex,tex inoremap <buffer> ;; <Esc>/<++><Enter>ca<
:    autocmd FileType plaintex,tex nnoremap <buffer> <Leader>v :!zathura %:r.pdf &<CR><CR>
:    autocmd FileType plaintex,tex nnoremap <buffer> <Leader>f gqap
:    autocmd FileType plaintex,tex nnoremap <buffer> ;def "zyiw:!sdcv -u WordNet -n <C-r>z<CR>
:    autocmd FileType plaintex,tex nnoremap <buffer> ;syn "zyiw:!sdcv -u "English Thesaurus" -n <C-r>z<CR>
:    autocmd FileType plaintex,tex inoremap <buffer> ;it \textit{}<++><Esc>T{i
:    autocmd FileType plaintex,tex inoremap <buffer> ;bf \textbf{}<++><Esc>T{i
:    autocmd FileType plaintex,tex inoremap <buffer> ;key \keyword{}<++><Esc>T{i
:    autocmd FileType plaintex,tex inoremap <buffer> ;su \textsubscript{}<++><Esc>T{i
:    autocmd FileType plaintex,tex inoremap <buffer> ;ch \chapter{}<Enter><Enter><++><Esc>2kf}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;se \section{}<Enter><Enter><++><Esc>2kf}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;sse \subsection{}<Enter><Enter><++><Esc>2kf}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;sss \subsubsection{}<Enter><Enter><++><Esc>2kf}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;ref \ref{}<++><Esc>F}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;cit ~\cite{}<++><Esc>F}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;fot \footnote{}<++><Esc>F}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;rf Figure~\ref{fig:}<++><Esc>F}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;fso \small\raggedleft\textit{Source: }<Esc>i
:    autocmd FileType plaintex,tex inoremap <buffer> ;rc Chapter~\ref{cha:}<++><Esc>F}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;rse Section~\ref{se:}<++><Esc>F}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;rss Subsection~\ref{sse:}<++><Esc>F}i
:    autocmd FileType plaintex,tex inoremap <buffer> ;fig \begin{figure}<CR>\centering<CR>\includegraphics[width=0.7\textwidth]{}<CR>\caption[<++>]{<++>}<CR>\label{fig:<++>}<CR>\small\raggedleft\textit{Source: <++>}<CR>\end{figure}<CR><++><Esc>5k$i
:    autocmd FileType plaintex,tex inoremap <buffer> ;eq \begin{equation}<CR>\label{eq:}<CR><++><CR>\end{equation}<CR><++><Esc>3k$i
:    autocmd FileType plaintex,tex inoremap <buffer> ;enum \begin{enumerate}[noitemsep]<CR>\item <CR><++><CR>\end{enumerate}<CR><++><Esc>3k$a
:    autocmd FileType plaintex,tex inoremap <buffer> ;item \begin{itemize}[noitemsep]<CR>\item <CR><++><CR>\end{itemize}<CR><++><Esc>3k$a
:    autocmd FileType plaintex,tex inoremap <buffer> ;ii \item <CR><++><Esc>k$a
:    autocmd FileType plaintex,tex inoremap <buffer> ;lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sollicitudin dolor ut condimentum ornare. Nullam eu risus justo. Fusce in tempus nibh, nec bibendum erat. In hac habitasse platea dictumst. Donec sodales hendrerit molestie. Maecenas porta efficitur dolor, eu scelerisque libero gravida id. Vestibulum non urna molestie, pellentesque elit a, luctus est. Integer dapibus est congue mi ultricies, ac venenatis lectus malesuada. Nunc nisl est, faucibus non varius nec, suscipit eu neque. Nulla arcu dolor, fringilla ut porttitor quis, ullamcorper et metus. Etiam tempor hendrerit justo a vulputate. Pellentesque bibendum ipsum sed ex tempus ultricies. Suspendisse interdum eros orci, a.
":    autocmd FileType plaintex,tex inoremap <BS><BS><BS> <Esc>dbxi
:augroup END
