" (un)comment shortcut
if has("autocmd")
	autocmd BufEnter * :syntax sync fromstart
	autocmd FileType c,cpp,java,scala let b:comment_start = '// '
	autocmd FileType css              let b:comment_start = '/*'| let b:comment_stop = '*/'
	autocmd FileType html             let b:comment_start = '<!-- '| let b:comment_stop = ' -->'
	autocmd FileType dosini           let b:comment_start = ';'
	autocmd FileType dot,javascript   let b:comment_start = '// '
	autocmd FileType mail             let b:comment_start = '> '
	autocmd FileType sql              let b:comment_start = '-- '
	autocmd FileType tex              let b:comment_start = '% '
	autocmd FileType vim              let b:comment_start = '" '
	autocmd FileType rst              let b:comment_start = '.. '
	autocmd FileType m4               let b:comment_start = 'dnl '
endif
function! EscapeRegex(var)
	return escape(a:var, '-[]{}()*+?.,\/^$|#')
endfunction

function! CommentSelection(comment) range
	let l:winview = winsaveview()
	let comment_start=(exists("b:comment_start")) ? EscapeRegex(b:comment_start) : "#"
	let comment_stop=(exists("b:comment_stop")) ? EscapeRegex(b:comment_stop) : ""
	let re_comment = ['s/^/' . comment_start . '/e', 's/$/' . comment_stop . '/e']
	let re_uncomment = ['s/^' . comment_start . '//e', 's/' . comment_stop . '$//e']
	if (comment_stop == "")
		execute a:firstline . ',' . a:lastline . (a:comment ? re_comment : re_uncomment)[0]
	else
		execute a:firstline . ',' . a:firstline . (a:comment ? re_comment : re_uncomment)[0]
		execute a:lastline . ',' . a:lastline . (a:comment ? re_comment : re_uncomment)[1]
	endif
	call winrestview(l:winview)
endfunction

noremap <silent><F2> :call CommentSelection(1)<CR>
noremap <silent><F3> :call CommentSelection(0)<CR>
" (un)comment shortcut end

