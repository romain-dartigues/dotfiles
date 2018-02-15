if has("autocmd")
	autocmd FileType python let g:pyindent_continue = '&sw'
	autocmd FileType python let g:pyindent_open_paren = '&sw'
	autocmd FileType css    setlocal sts=0
	autocmd FileType html   setlocal sw=1 ts=1 et sts=1
	autocmd FileType python setlocal tw=78 sts=0
	autocmd FileType rst    setlocal tw=78 sw=3 ts=3 et nofen
	autocmd FileType yaml   setlocal sw=2 ts=2 et sts=0
	autocmd FileType dockerfile setlocal sw=4 ts=4 et
	autocmd BufRead,BufNewFile  bash-fc-* setfiletype sh
	autocmd BufNewFile,BufRead *.sls set filetype=yaml
	autocmd BufNewFile,BufRead *.jinja set filetype=jinja
endif
