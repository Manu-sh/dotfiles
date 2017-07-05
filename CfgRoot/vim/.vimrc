syntax on

set backupdir=~/.tmp
filetype plugin indent on    " required
set noautoindent
set title

set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab
"inoremap ^? ^H
"set t_kb=^H
"set t_kD=^?
set backspace=2

set wildmenu

set number
set numberwidth=4	"Set the line numbers to 4 spaces
set nowrap
set encoding=utf-8
set hlsearch
set nocompatible
set undolevels=1000

set background=dark
colorscheme neon "blue
" hybrid
"blue.vim      default.vim  desert.vim   evening.vim   koehler.vim  murphy.vim  peachpuff.vim  ron.vim    slate.vim  zellner.vim
"darkblue.vim  delek.vim    elflord.vim  industry.vim  morning.vim  pablo.vim   README.txt     shine.vim  torte.vim

if has('autocmd')  
	autocmd Filetype java setlocal omnifunc=javacomplete#Complete 
endif

if has('mouse')
	set mouse=a
endif

set statusline=%F%m%r%h%w\ %y\ [row=%l/%L]\ [col=%02v]\ [%02p%%]\


" filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

Plugin 'VundleVim/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'bkad/CamelCaseMotion'
Plugin 'octol/vim-cpp-enhanced-highlight'


" Plugin 'Valloric/YouCompleteMe'
" Plugin 'mileszs/ack.vim'
" Plugin 'tyok/nerdtree-ack'

let g:SuperTabDefaultCompletionType = "<c-n>"

" To use the default mappings, add the following to your vimrc
set runtimepath^=~/.vim/bundle/*

call camelcasemotion#CreateMotionMappings('<leader>')


" All of your Plugins must be added before the following line
call vundle#end()            " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" JavaComplete Plugin

" To enable smart (trying to guess import option) inserting class imports with F4
" http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)

" nmap: Display normal mode maps
" imap: Display insert mode maps

"nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
"imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
"
"" To enable usual (will ask for import option) inserting class imports with F5
"nmap <F5> <Plug>(JavaComplete-Imports-Add)
"imap <F5> <Plug>(JavaComplete-Imports-Add)
"
"" To add all missing imports with F6
"nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
"imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
"
"" To remove all missing imports with F7:
"nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
"imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
"
"  nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
"  nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
"  nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
"  nmap <leader>jii <Plug>(JavaComplete-Imports-Add)
"
"  imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
"  imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
"  imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
"  imap <C-j>ii <Plug>(JavaComplete-Imports-Add)
"
"  nmap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)
"
"  imap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)
"
"  nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
"  nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
"  nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
"  nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
"  nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)
"  nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
"  nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
"  nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)
"
"  imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
"  imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
"  imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)
"
"  vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
"  vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
"  vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
"
"  nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
"  nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)
