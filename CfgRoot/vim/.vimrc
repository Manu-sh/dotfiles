" config files


"source "include/ycm.cfg"

" TODO vim dictionary completion using tab
" if &filetype == "" || &filetype == "txt"
"	inoremap <Tab> <C-n>
" endif

"include paths
" let &path.="/usr/include,/usr/local/include"


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

" LSP
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction


augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


" file manager
Plugin 'preservim/nerdtree'

" How can I open a NERDTree automatically when vim starts up?" 
autocmd vimenter * NERDTree | wincmd w

" How can I close vim if the only window left open is a NERDTree?
" https://vi.stackexchange.com/questions/15997/change-buffer-focus-on-enter
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" display/hide nerdtree
map <F1> :NERDTreeToggle<CR>

" change nerdtree working dir
let g:NERDTreeMapChangeRoot ='<F2>'

" openfile into a new tab (use C-PgUp and C-PgOn to switch between the tabs)
let g:NERDTreeMapOpenInTab  ='<C-Home>'

" git
Plugin 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeGitStatusIndicatorMapCustom= {
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

" the plugin will allow you to navigate seamlessly between vim and tmux splits using a consistent set of hotkeys
Plugin 'christoomey/vim-tmux-navigator'

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <C-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

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
