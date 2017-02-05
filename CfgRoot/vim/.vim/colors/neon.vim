if v:version >= 700
	set t_Co=256
	syntax reset
	hi clear
	let g:colors_name = "neon"
else
	finish
endif

" cian 122 #87ffd7
" pastel blue 45 #00d7ff
" fucsia 197 #ff005f
" neon purple 207 #ff5fff
" neon fucsia 213 #ff87ff
" other 109 #87afaf, 92 #8700d7, 177 #d787ff
" pink pastel 225 #ffdfff
" neon yellow pastel 229 #ffffaf
" pastel green 120 #87ff87
" light neon purple 99 #875fff,
" deep neon pink 13 #ff00ff
"
"
"
"hi*Commentany comment
"
"hi*Constantany constant
"hi Stringa string constant: "this is a string"
"hi Charactera character constant: 'c', '\n'
"hi Numbera number constant: 234, 0xff
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
hi NonText	ctermfg=197 ctermbg=NONE cterm=NONE
hi Normal	ctermfg=177 ctermbg=NONE cterm=NONE " 122
hi Type		ctermfg=197 ctermbg=NONE cterm=NONE
hi LineNr	ctermfg=122 ctermbg=NONE cterm=NONE
hi Include	ctermfg=197 ctermbg=NONE cterm=bold
hi Statement	ctermfg=207 ctermbg=NONE cterm=NONE

" the C string and <*.h>
hi String	ctermfg=122	cterm=NONE "177
hi Macro	ctermfg=99	cterm=NONE
hi Constant	ctermfg=92	cterm=NONE
hi Structure	ctermfg=207	cterm=bold
hi Comment	ctermfg=225	cterm=NONE
hi Character	ctermfg=197
hi Number	ctermfg=197
hi Operator	ctermfg=225
hi Repeat	ctermfg=99	cterm=NONE
hi Conditional  ctermfg=99	cterm=NONE
hi SpecialChar	ctermfg=197	cterm=NONE
hi Label	ctermfg=197	cterm=NONE

hi cBraces	ctermfg=13	cterm=bold
hi cAnsiFunction ctermfg=229	cterm=bold
