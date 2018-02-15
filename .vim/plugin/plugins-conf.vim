
" plugins ********************************************************************

" for https://github.com/chrisbra/csv.vim
let g:csv_comment = '#'
highlight link CSVDelimiter LineNr
highlight link CSVDelimiter Statement
highlight link CSVColumnEven MoreMsg
highlight link CSVColumnOdd Special
highlight link CSVColumnHeaderOdd Title
highlight link CSVColumnHeaderEven Title

" for https://github.com/thinca/vim-localrc
let g:localrc_filename = ".vimrc"

" for https://github.com/Rykka/riv.vim/issues/39
let g:riv_disable_folding = 1


