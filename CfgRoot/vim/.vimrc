syntax on

filetype plugin indent off
set title

set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab

set wildmenu

set number
set numberwidth=4	"Set the line numbers to 4 spaces
set nowrap
set encoding=utf-8
set hlsearch


set background=dark
colorscheme hybrid 

"blue.vim      default.vim  desert.vim   evening.vim   koehler.vim  murphy.vim  peachpuff.vim  ron.vim    slate.vim  zellner.vim
"darkblue.vim  delek.vim    elflord.vim  industry.vim  morning.vim  pablo.vim   README.txt     shine.vim  torte.vim


if has("autocmd")  
	autocmd Filetype java setlocal omnifunc=javacomplete#Complete 
endif
