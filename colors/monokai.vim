" " File:       monokai.vim
" " Maintainer: Keyv Chan (keyvchan)
" " URL:        https://github.com/keyvchan/vim-monokai
" " License:    MIT
" "
" " The colour palette is from http://www.colourlovers.com/
" " The original code is from https://github.com/w0ng/vim-hybrid
" 
" Initialisation
" --------------

if !has("gui_running") && &t_Co < 256
	finish
endif

if ! exists("g:monokai_gui_italic")
	let g:monokai_gui_italic = 1
endif

if ! exists("g:monokai_term_italic")
	let g:monokai_term_italic = 0
endif

let g:monokai_termcolors = 256 " does not support 16 color term right now.

set background=dark
" hi clear

if exists("syntax_on")
	syntax reset
endif
" 
let colors_name = "monokai"
" 
function! s:h(group, style)
	let s:ctermformat = "NONE"
	let s:guiformat = "NONE"
	if has_key(a:style, "format")
		let s:ctermformat = a:style.format
		let s:guiformat = a:style.format
	endif
	if g:monokai_term_italic == 0
		let s:ctermformat = substitute(s:ctermformat, ",italic", "", "")
		let s:ctermformat = substitute(s:ctermformat, "italic,", "", "")
		let s:ctermformat = substitute(s:ctermformat, "italic", "", "")
	endif
	if g:monokai_gui_italic == 0
		let s:guiformat = substitute(s:guiformat, ",italic", "", "")
		let s:guiformat = substitute(s:guiformat, "italic,", "", "")
		let s:guiformat = substitute(s:guiformat, "italic", "", "")
	endif
	if g:monokai_termcolors == 16
		let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
		let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
	else
		let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
		let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
	end
	execute "highlight" a:group
				\ "guifg="   (has_key(a:style, "fg")      ? a:style.fg.gui   : "NONE")
				\ "guibg="   (has_key(a:style, "bg")      ? a:style.bg.gui   : "NONE")
				\ "guisp="   (has_key(a:style, "sp")      ? a:style.sp.gui   : "NONE")
				\ "gui="     (!empty(s:guiformat) ? s:guiformat   : "NONE")
				\ "ctermfg=" . l:ctermfg
				\ "ctermbg=" . l:ctermbg
				\ "cterm="   (!empty(s:ctermformat) ? s:ctermformat   : "NONE")
endfunction
" 
 " Palettes
 " --------
let s:white       = { "gui": "#FFFFFF", "cterm": "15" }
let s:black       = { "gui": "#272822", "cterm": "234" }
let s:lightblack  = { "gui": "#2D2E27", "cterm": "235" }
let s:lightblack2 = { "gui": "#383a3e", "cterm": "236" }
let s:darkblack   = { "gui": "#211F1C", "cterm": "233" }
let s:grey        = { "gui": "#8F908A", "cterm": "244" }
let s:lightgrey   = { "gui": "#575b61", "cterm": "237" }
let s:darkgrey    = { "gui": "#64645e", "cterm": "239" }
let s:warmgrey    = { "gui": "#75715E", "cterm": "59"  }

let s:pink        = { "gui": "#F93C80", "cterm": "197" }
let s:green       = { "gui": "#84F57D", "cterm": "10"  }
let s:aqua        = { "gui": "#66d9ef", "cterm": "81"  }
let s:darkaqua        = { "gui": "#4EADE5", "cterm": "81"  }
let s:yellow      = { "gui": "#FFFF43", "cterm": "226" }
let s:orange      = { "gui": "#FFBD37", "cterm": "208" }
let s:deepOrange  = { "gui": "#FF8C00", "cterm": "208" }
let s:purple      = { "gui": "#ae81ff", "cterm": "141" }
let s:darkpurple      = { "gui": "#855dcf", "cterm": "141" }
let s:red         = { "gui": "#FF1919", "cterm": "196" }
let s:darkred     = { "gui": "#F44747", "cterm": "52"  }

let s:addfg       = { "gui": "#d7ffaf", "cterm": "193" }
let s:addbg       = { "gui": "#5f875f", "cterm": "65"  }
let s:delbg       = { "gui": "#f75f5f", "cterm": "167" }
let s:changefg    = { "gui": "#d7d7ff", "cterm": "189" }
let s:changebg    = { "gui": "#5f5f87", "cterm": "60"  }
" 
" " Highlighting
" " ------------
" 
" editor
call s:h("Normal",        { "fg": s:white,														})
call s:h("ColorColumn",   {                     "bg": s:lightblack								})
call s:h("Cursor",        { "fg": s:black,      "bg": s:white									})
call s:h("CursorColumn",  {                     "bg": s:lightblack2								})
call s:h("CursorLine",    {                     "bg": s:lightblack2								})
call s:h("NonText",       { "fg": s:lightgrey													})
call s:h("StatusLine",    { "fg": s:warmgrey,   "bg": s:black,        "format": "reverse"		})
call s:h("StatusLineNC",  { "fg": s:darkgrey,   "bg": s:warmgrey,     "format": "reverse"		})
call s:h("TabLine",       { "fg": s:white,      "bg": s:darkblack,    "format": "reverse"		})
call s:h("Visual",        {                     "bg": s:lightgrey								})
call s:h("Search",        { "fg": s:black,      "bg": s:yellow									})
call s:h("MatchParen",    { "fg": s:purple,                           "format": "underline,bold"})
call s:h("Question",      { "fg": s:yellow														})
call s:h("ModeMsg",       { "fg": s:yellow														})
call s:h("MoreMsg",       { "fg": s:yellow														})
call s:h("ErrorMsg",      {	"fg": s:red					})
call s:h("WarningMsg",    { "fg": s:red															})
call s:h("VertSplit",     { "fg": s:darkgrey   					})
call s:h("LineNr",        { "fg": s:yellow,														})
call s:h("CursorLineNr",  { "fg": s:yellow,														})
call s:h("SignColumn",    {                     								})
call s:h("NvimInternalError",{"fg":s:white											})

" misc
call s:h("SpecialKey",    { "fg": s:pink														})
call s:h("Title",         { "fg": s:yellow														})
call s:h("Directory",     { "fg": s:white											})

" diff
call s:h("DiffAdd",       { "fg": s:addfg,      "bg": s:addbg									})
call s:h("DiffDelete",    { "fg": s:black,      "bg": s:delbg									})
call s:h("DiffChange",    { "fg": s:changefg,   "bg": s:changebg								})
call s:h("DiffText",      { "fg": s:black,      "bg": s:aqua									})

" fold
call s:h("Folded",        { "fg": s:warmgrey,   "bg": s:darkblack								})
call s:h("FoldColumn",    {                     "bg": s:darkblack								})
"        Incsearch"

" popup menu
call s:h("Pmenu",         { "fg": s:white, 									})
call s:h("PmenuSel",      { "fg": s:grey,              "bg":s:black,"format": "reverse,bold"  })
call s:h("PmenuThumb",    { "fg": s:lightblack, "bg": s:white									})
" 
" " Generic Syntax Highlighting
" " ---------------------------

call s:h("Constant",      { "fg": s:purple })
call s:h("Number",        { "fg": s:purple })
call s:h("Float",         { "fg": s:purple })
call s:h("Boolean",       { "fg": s:purple })
call s:h("Character",     { "fg": s:yellow })
call s:h("String",        { "fg": s:yellow })

call s:h("Type",          { "fg": s:pink , "format": "bold"})
call s:h("Structure",     { "fg": s:aqua })
call s:h("StorageClass",  { "fg": s:aqua })
call s:h("Typedef",       { "fg": s:aqua })
call s:h("Function",      { "fg": s:aqua })


call s:h("Identifier",    { "fg": s:green })

call s:h("Statement",     { "fg": s:pink })
call s:h("Operator",      { "fg": s:pink })
call s:h("Label",         { "fg": s:pink })

call s:h("Keyword",       { "fg": s:pink , "format": "bold"})

call s:h("PreProc",       { "fg": s:green })
call s:h("Include",       { "fg": s:pink , "format": "bold"})
call s:h("Define",        { "fg": s:pink , "format": "bold"})
call s:h("Macro",         { "fg": s:green })
call s:h("PreCondit",     { "fg": s:green })

call s:h("Special",       { "fg": s:purple })
call s:h("SpecialChar",   { "fg": s:pink })
call s:h("Delimiter",     { "fg": s:white })
call s:h("SpecialComment",{ "fg": s:aqua })
call s:h("Tag",           { "fg": s:pink })

call s:h("Todo",          { "fg": s:deepOrange,   "format": "bold,italic" })
call s:h("Comment",       { "fg": s:grey, "format": "italic" })
""   
 " call s:h("Underlined",    { "fg": s:green, "gui": "underline"})
 " call s:h("Ignore",        {})
 " call s:h("Error",         { "fg": s:white})
 "  
 " call s:h("spellBad",    { "guisp": "#fcaf3e" })
 " call s:h("spellCap",        {"guisp": "#73d216"})
 " call s:h("spellRare",         { "guisp": "#ad7fa8" })
 " call s:h("spellLocal",         { "guisp": "#729fcf" })
 

 call s:h("LspDiagnosticsDefaultHint",    { "fg": s:aqua })
 call s:h("LspDiagnosticsDefaultError",        {"fg": s:red })
 call s:h("LspDiagnosticsDefaultWarning",         { "fg": s:yellow })

" TreeSitter stuff
call s:h("TSAnnotation", {"fg": s:pink})
call s:h("TSAttribute",	{"fg": s:green})
call s:h("TSBoolean",	{"fg": s:purple})
call s:h("TSCharacter",		{"fg": s:yellow })
call s:h("TSComment",       { "fg": s:grey, "format": "italic" })
call s:h("TSConstructor",		{"fg": s:green })
call s:h("TSConditional",		{"fg": s:pink })
call s:h("TSConstant",		{"fg": s:green })
call s:h("TSConstBuiltin",		{"fg": s:darkpurple })
call s:h("TSConstMacro",		{"fg": s:green })
call s:h("TSError",		{"fg": s:pink })
call s:h("TSException",		{"fg": s:pink })
call s:h("TSField",		{"fg": s:white })
call s:h("TSFloat",		{"fg": s:purple })
call s:h("TSFunction",		{"fg": s:aqua })
call s:h("TSFuncBuiltin",		{"fg": s:darkaqua })
call s:h("TSFuncMacro",		{"fg": s:green })
call s:h("TSInclude",		{"fg": s:pink, 'format': 'bold'})
call s:h("TSKeyword",	{"fg": s:pink, 'format': 'bold'})
call s:h("TSKeywordFunction",		{"fg": s:aqua })
call s:h("TSLabel",		{"fg": s:pink })
call s:h("TSMethod",		{"fg": s:aqua })
call s:h("TSNamespace",		{"fg": s:pink })
call s:h("TSNone",		{"fg": s:pink })
call s:h("TSNumber",		{"fg": s:purple })
call s:h("TSOperator",		{"fg": s:pink })
call s:h("TSParameter",		{"fg": s:white })
call s:h("TSParameterReference",		{"fg": s:pink })
call s:h("TSProperty",		{"fg": s:green })
call s:h("TSPunctDelimiter",		{"fg": s:white })
call s:h("TSPunctBracket",		{"fg": s:white })
call s:h("TSPunctSpecial",		{"fg": s:white })
call s:h("TSRepeat",		{"fg": s:pink })
call s:h("TSstring",		{"fg": s:yellow })
call s:h("TSstringRegex",		{"fg": s:pink })
call s:h("TSstringEscape",		{"fg": s:purple })
call s:h("TSTag",		{"fg": s:pink })
call s:h("TSTagDelimiter",		{"fg": s:pink })
call s:h("TSNext",		{"fg": s:pink })
call s:h("TSEmphasis",		{"fg": s:pink })
call s:h("TSUnderline",		{"fg": s:pink })
call s:h("TSStrike",		{"fg": s:pink })
call s:h("TSTitle",		{"fg": s:pink })
call s:h("TSURL",		{"fg": s:pink })
call s:h("TSType",		{"fg": s:pink })
call s:h("TSTypeBuiltin",		{"fg": s:darkpurple })
call s:h("TSVariable",		{"fg": s:orange })
call s:h("TSVariableBuiltin",		{"fg": s:darkaqua })

