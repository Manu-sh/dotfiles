if v:version >= 700
	set t_Co=256
	syntax reset
	hi clear
	let g:colors_name = "term80_green"
else
	finish
endif

"hi*Commentany comment
"
"hi*Constantany constant
"hi Stringa string constant: "this is a string"
"hi Charactera character constant: 'c', '\n'
"hi Numbera number constant: 2111, 0xff
"hi Booleana boolean constant: TRUE, false
"hi Floata floating point constant: 2.3e10
"
"hi*Identifierany variable name
"hi Functionfunction name (also: methods for classes)
"
"hi*Statementany statement
"hi Conditionalif, then, else, endif, switch, etc.
"hi Repeatfor, do, while, etc.
"hi Labelcase, default, etc.
"hi Operator"sizeof", "+", "*", etc.
"hi Keywordany other keyword
"hi Exceptiontry, catch, throw
"
"hi*PreProcgeneric Preprocessor
"hi Includepreprocessor #include
"hi Definepreprocessor #define
"hi Macrosame as Define
"hi PreConditpreprocessor #if, #else, #endif, etc.
"
"hi*Typeint, long, char, etc.
"hi StorageClassstatic, register, volatile, etc.
"hi Structurestruct, union, enum, etc.
"hi TypedefA typedef
"
"hi*Specialany special symbol
"hi SpecialCharspecial character in a constant
"hi Tagyou can use CTRL-] on this
"hi Delimitercharacter that needs attention
"hi SpecialCommentspecial things inside a comment
"hi Debugdebugging statements
"
"hi*Underlinedtext that stands out, HTML links
"
"hi*Ignoreleft blank, hidden  |hl-Ignore|
"
"hi*Errorany erroneous construct
"
"hi*Todoanything that needs extra attention; mostly the
"ctermfgkeywords TODO FIXME and XXX
"
"

hi NonText	ctermfg=49	ctermbg=NONE	cterm=NONE	guifg=#ff005f		"guibg=NONE
"hi Normal	ctermfg=85	ctermbg=NONE	cterm=NONE	guifg=#d787ff		guibg=#0D151D
hi Type		ctermfg=122	ctermbg=NONE	cterm=NONE	guifg=#ff005f		"guibg=NONE
hi LineNr	ctermfg=122	ctermbg=NONE	cterm=NONE	guifg=#87ffd7		"guibg=NONE
hi Include	ctermfg=122	ctermbg=NONE	cterm=bold	guifg=#ff005f		"guibg=NONE
hi Statement	ctermfg=122	ctermbg=NONE	cterm=NONE	guifg=#ff5fff		"guibg=NONE

" the C string and <*.h>
hi String	ctermfg=157	ctermbg=NONE	cterm=NONE	guifg=#87ffd7		"guibg=NONE
hi Function     ctermfg=157	ctermbg=NONE	cterm=NONE	guifg=#87ffd7		"guibg=NONE
hi Macro	ctermfg=120	ctermbg=NONE	cterm=NONE	guifg=#875fff		"guibg=NONE
hi Boolean	ctermfg=120	ctermbg=NONE	cterm=NONE	guifg=#875fff		"guibg=NONE
hi Constant	ctermfg=120	ctermbg=NONE	cterm=NONE	guifg=#8700d7		"guibg=NONE
hi Structure	ctermfg=157	ctermbg=NONE	cterm=bold	guifg=#ff5fff		"guibg=NONE
hi Comment	ctermfg=225	ctermbg=NONE	cterm=NONE	guifg=#ffdfff		"guibg=NONE
hi Character	ctermfg=49	ctermbg=NONE	cterm=NONE	guifg=#ff005f		"guibg=NONE
hi Number	ctermfg=49      ctermbg=NONE	cterm=NONE	guifg=#ff005f		"guibg=NONE
hi Operator	ctermfg=225     ctermbg=NONE	cterm=NONE	guifg=#ffdfff		"guibg=NONE
hi Repeat	ctermfg=120	ctermbg=NONE	cterm=NONE	guifg=#875fff		"guibg=NONE
hi Conditional  ctermfg=120	ctermbg=NONE	cterm=NONE	guifg=#875fff		"guibg=NONE
hi SpecialChar	ctermfg=49	ctermbg=NONE	cterm=NONE	guifg=#ff005f		"guibg=NONE
hi Label	ctermfg=49	ctermbg=NONE	cterm=NONE	guifg=#ff005f		"guibg=NONE

hi cBraces	 ctermfg=157	ctermbg=NONE	cterm=bold	guifg=#ff00ff		"guibg=NONE
hi cAnsiFunction ctermfg=73	ctermbg=NONE	cterm=bold	guifg=#ffffaf		"guibg=NONE
