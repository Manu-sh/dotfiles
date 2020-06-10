" TODO vim dictionary completion using tab
" if &filetype == "" || &filetype == "txt"
"	inoremap <Tab> <C-n>
" endif

"include paths
" let &path.="/usr/include,/usr/local/include"

" YCM
" let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = "$HOME/.vim/ycm_extra_conf/.ycm_extra_conf.py"

" load without asking
let g:ycm_confirm_extra_conf = 0

let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_path_to_python_interpreter = '/usr/bin/python3'
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_seed_identifiers_with_syntax=1

let g:ycm_cache_omnifunc = 1
let g:ycm_collect_identifiers_from_tags_files = 1

" use libclang instead of clangd
let g:ycm_use_clangd = 0


" popup: https://github.com/ycm-core/YouCompleteMe/issues/3667
set updatetime=1000 " set CursorHold timeout
let g:ycm_auto_hover = 'CursorHold'

" let g:ycm_hover = {'command': 'GetDoc', 'syntax': &filetype }
" let g:ycm_hover = {'command': 'GetDoc', 'syntax': &syntax }
" questo è in ~/.vim/after/syntax/vim.c

nmap + <plug>(YCMHover)



set completeopt-=preview
" let g:ycm_add_preview_to_completeopt = 0
" let g:ycm_autoclose_preview_window_after_insertion  = "preview"
" let g:ycm_autoclose_preview_window_after_completion = 1

" 0 to disable errors suggests
let g:ycm_show_diagnostics_ui = 1
let g:ycm_echo_current_diagnostic = 1

let g:ycm_auto_trigger = 1
" let g:ycm_key_invoke_completion = "<TAB>"

let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,cuda,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

let g:ycm_filetype_blacklist = { 'java' : 1, 'txt' : 1, '' : 1 }

" let &t_SI = "\e[6 q"
" let &t_EI = "\e[2 q"

" optional reset cursor on start:
" augroup myCmds
"	au!
"	autocmd VimEnter * silent !echo -ne "\e[2 q"
" augroup END

" rxvt only accepts these escape sequences after version 9.21
if &term =~ '^xterm\\|rxvt'

  " solid underscore orange in insert mode
  let &t_SI .= "\<Esc>]12;orange\<Esc>[4 q"

  " solid block
  let &t_EI .= "\<Esc>]12;orange\<Esc>[2 q"

  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif



let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1

 if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.maxlinenr = '㏑'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = 'Ɇ'
  let g:airline_symbols.whitespace = 'Ξ'

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.maxlinenr = ''

  " old vim-powerline symbols
  let g:airline_left_sep = '⮀'
  let g:airline_left_alt_sep = '⮁'
  let g:airline_right_sep = '⮂'
  let g:airline_right_alt_sep = '⮃'
  let g:airline_symbols.branch = '⭠'
  let g:airline_symbols.readonly = '⭤'
  let g:airline_symbols.linenr = '⭡'


function Private()
	:s/^\t/\tprivate\ /g
endfunction

" https://vi.stackexchange.com/questions/3537/copying-a-string-to-a-variable-or-a-register-from-within-a-function
" http://learnvimscriptthehardway.stevelosh.com/chapters/30.html
" https://stackoverflow.com/questions/666757/how-to-expand-variables-in-vim-commands
" https://vi.stackexchange.com/questions/1942/how-to-execute-shell-commands-silently
" https://stackoverflow.com/questions/7078538/refresh-vim-buffer
" https://stackoverflow.com/questions/14717571/vimscript-how-to-get-current-filetype-as-a-variable
" http://vim.wikia.com/wiki/Get_the_name_of_the_current_file

function ShowColor()
	let cw = expand('<cword>')
	execute 'silent !zenity --color-selection --color=\#'.cw' 2>/dev/null'
	redraw!
endfunction


" im noob with VimL
function BuildLatexAndShow() 

	if &filetype != "tex"
		return
	endif

	let wd    = expand('%:p:h')
	let fname_noprefix = expand('%:r')

	execute '!pdflatex '.wd."/".fname_noprefix.".tex"
	execute 'silent !rm -f '.wd."/".fname_noprefix.".out" 'silent !rm -f '.wd."/".fname_noprefix.".log" 'silent !rm -f '.wd."/".fname_noprefix.".aux"
	execute 'silent !mupdf '.wd."/".fname_noprefix.".pdf"

endfunction

function FigletArt()
	let cw = expand('<cword>')
	execute ':read !figlet '.cw
endfunction

function ShowManpages()
	let word = expand('<cword>')
	if &filetype == "c" || &filetype == "cpp"
		execute 'silent !man 2 '.word' || man 3 '.word
		redraw!
	else
		execute 'silent !man '.word
		redraw!
	endif
endfunction

map _ :call ShowColor()<LF>

map ° :call BuildLatexAndShow()<LF>

syntax on

" help starstart (** is for recursive find)
" the path variable is used for every operation about file
" set path +=**
set backupdir=~/.tmp
filetype plugin indent on    " required
set noautoindent
set title

" set tab size .. 4 8 ..
set tabstop=4
set softtabstop=4
set shiftwidth=4
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

set cryptmethod=blowfish2
set ttyfast

set background=dark
" colorscheme Tomorrow-Night-Bright
colorscheme nord
" colorscheme neon
" colorscheme Tomorrow-Night
" colorscheme new
"term80-green
" colorscheme neon "blue
" hybrid
"blue.vim      default.vim  desert.vim   evening.vim   koehler.vim  murphy.vim  peachpuff.vim  ron.vim    slate.vim  zellner.vim
"darkblue.vim  delek.vim    elflord.vim  industry.vim  morning.vim  pablo.vim   README.txt     shine.vim  torte.vim


" disable auto-comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

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


" Plugin 'chriskempson/base16-vim'
" Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'artur-shaik/vim-javacomplete2'
" Plugin 'bkad/CamelCaseMotion'
" Plugin 'mileszs/ack.vim'
" Plugin 'tyok/nerdtree-ack'

" OTHER
Plugin 'VundleVim/Vundle.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'

" Plugin 'ervandew/supertab'
" let g:SuperTabDefaultCompletionType = "<c-n>"

" YCM
Plugin 'Valloric/YouCompleteMe'

" file manager
Plugin 'preservim/nerdtree'

" How can I open a NERDTree automatically when vim starts up?" 
autocmd vimenter * NERDTree

" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" display/hide nerdtree
map <F1> :NERDTreeToggle<CR>

" change nerdtree working dir
let g:NERDTreeMapChangeRoot ='<F2>'

" openfile into a new tab (use C-PgUp and C-PgOn to switch between the tabs)
let g:NERDTreeMapOpenInTab  ='<C-Home>'

" git
Plugin 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" icons for nerdtree and other plugins
set encoding=UTF-8
Plugin 'ryanoasis/vim-devicons'

" Airline Bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" git show added/deleted lines
Plugin 'airblade/vim-gitgutter'

" tagbar
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>


Plugin 'ChrisKempson/Tomorrow-Theme'

" Plugin 'chriskempson/base16-vim'
Plugin 'sonph/onehalf'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'dracula/vim'
Plugin 'ayu-theme/ayu-vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'mhartington/oceanic-next'
Plugin 'joshdick/onedark.vim'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'ajh17/Spacegray.vim'


" Plugin 'flazz/vim-colorschemes'

" Deoplete
" set pyxversion=3
" set encoding=utf-8
" let g:python_host_prog = "/usr/bin/python2"
" let g:python3_host_prog = "/usr/bin/python3"
" let g:deoplete#enable_at_startup = 0
" Plugin 'roxma/nvim-yarp'
" Plugin 'roxma/vim-hug-neovim-rpc'
" Plugin 'Shougo/deoplete.nvim'
" Plugin 'zchee/deoplete-clang'

" Deoplete-Clang
" let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
" let g:deoplete#sources#clang#clang_header  = "/usr/bin/clang"

" To use the default mappings, add the following to your vimrc
set runtimepath^=~/.vim/bundle/*

" call camelcasemotion#CreateMotionMappings('<leader>')


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


""" map à : JCgenerateAccessorGetter<LF>





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




" deoplete.vim contains vim settings relevant to the deoplete autocompletion
" plugin
" for more details about my neovim setup see:
" http://afnan.io/2018-04-12/my-neovim-development-setup/

" deoplete options
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_smart_case = 1
" let g:clang_complete_auto=1

" disable autocomplete by default
" let b:deoplete_disable_auto_complete=1
" let g:deoplete_disable_auto_complete=1
" call deoplete#custom#buffer_option('auto_complete', v:false)

" if !exists('g:deoplete#omni#input_patterns')
    " let g:deoplete#omni#input_patterns = {}
" endif

" Disable the candidates in Comment/String syntaxes.
" call deoplete#custom#source('_',
            " \ 'disabled_syntaxes', ['Comment', 'String'])

" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" set sources
" let g:deoplete#sources = {}
" let g:deoplete#sources.cpp = ['LanguageClient']
" let g:deoplete#sources.python = ['LanguageClient']
" let g:deoplete#sources.python3 = ['LanguageClient']
" let g:deoplete#sources.rust = ['LanguageClient']
" let g:deoplete#sources.c = ['LanguageClient']
" let g:deoplete#sources.vim = ['vim']
