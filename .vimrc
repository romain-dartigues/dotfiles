" my essentials **************************************************************
syntax on
set background=dark
set mouse=

set hlsearch
set ignorecase
set smartcase

set backspace=indent,eol,start

set wildmode=list:longest,full

set formatoptions=croqwn1
if v:version >= 703
	set formatoptions+=j
endif

"laststatus= 0: never, 1: when there is more than one window, 2: always
set laststatus=2
set shortmess+=Ir
set showcmd
set showmode
set statusline=%f\ +%l:%v\ %m%r%h%w%=[%p%%/%L]

set history=1000
set nobackup
if v:version > 702
	set noundofile
endif

if &diff
	set diffopt+=iwhite
endif


set encoding=utf8
set autoindent
set noexpandtab
set shiftwidth=8
set softtabstop=0
set tabstop=8
set textwidth=0

" show trailing whitespaces, whitespaces before a tab and NBSP
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$\| \+\ze\t\|\%u00a0/
autocmd InsertEnter * match ExtraWhitespace /\s\+$\| \+\ze\t\|\%u00a0/ " /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$\| \+\ze\t\|\%u00a0/
" show spaces after a tab
highlight ExtraWhitespaceAfterTab ctermbg=darkgreen guibg=darkgreen
call matchadd('ExtraWhitespaceAfterTab', '\t\zs \+')
if v:version >= 702
	" avoid memory leak
	autocmd BufWinLeave * call clearmatches()
endif

" not essentials *************************************************************

set term=xterm-256color
set t_Co=256

" movements center around the cursor
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap { {zz


" identify special characters (use:set list!), see:help listchars
set listchars=eol:¶,tab:␉⇥,trail:•,extends:»,precedes:«,nbsp:¬

" custom digraphs: ord(u'X')
digraph <3 9829 " ♥
digraph .; 8230 " …
digraph !? 8253 " ‽

" http://damien.lespiau.name/blog/2009/03/18/per-project-vimrc/
set exrc    " enable per-directory .vimrc files
set secure  " disable unsafe commands in local .vimrc files
