" Vim syntax file
" Language:	Roku BrightScript
" Maintainer:	Dylan Doxey <dylan.doxey@gmail.com>
" Last Change:
"   2011 February 3rd

" This is a hackified copy of vb.vim.

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

" BRS is case insensitive
syn case ignore

syn keyword brsConditional If Then ElseIf Else EndIf End

syn keyword brsOperator And Or Not
syn keyword brsBoolean  True False

syn match brsOperator "("
syn match brsOperator ")"
syn match brsOperator "\."
syn match brsOperator "\["
syn match brsOperator "]"
syn match brsOperator "\^"
syn match brsOperator "–"
syn match brsOperator "+"
syn match brsOperator "*"
syn match brsOperator "/"
syn match brsOperator "<"
syn match brsOperator ">"
syn match brsOperator "<>"
syn match brsOperator "="
syn match brsOperator "<="
syn match brsOperator ">="
syn match brsOperator "@"

syn match brsOperator "{"
syn match brsOperator ":"
syn match brsOperator "}"

syn keyword brsFunction For Each In EndFor
syn keyword brsFunction Function EndFunction
syn keyword brsFunction As Dim Exit
syn keyword brsFunction Line_Num Next ObjFun Pos
syn keyword brsFunction Print
syn keyword brsFunction Return Rnd Step
syn keyword brsFunction Stop Tab To Type
syn keyword brsFunction Sub EndSub
syn keyword brsFunction While ExitWhile EndWhile
syn keyword brsFunction Type Rnd Box Run Eval GetLastRunCompileError GetLastRunRuntimeError
syn keyword brsFunction Sleep Wait CreateObject GetInterface UpTime RebootSystem strtoi
syn keyword brsFunction ListDir ReadAsciiFile WriteAsciiFile CopyFile MatchFiles
syn keyword brsFunction DeleteFile DeleteDirectory FormatDrive
syn keyword brsFunction UCase LCase Asc Chr Instr Left Len Mid Right Str Val
syn keyword brsFunction Abs Atn Cos Csng Cdbl Exp Fix Int Log Sgn Sin Sqr Tan
syn keyword brsFunction ifList ifEnum roList ifMessagePort roInt roFloat roString
syn keyword brsFunction roBoolean roFunction roInvalid
syn keyword brsFunction ifInt ifIntOps ifFloat ifString ifStringOps ifFunction ifBoolean
syn keyword brsFunction orAssociativeArray roArray roXMLElement roXMLList

syn keyword brsTypes Array Interface
syn keyword brsTypes Integer Float Double Boolean String Object Dynamic

syn keyword brsConst Invalid

syn keyword brsTodo contained	TODO

syn keyword brsMethods isListItemSelected isScreenClosed isListFocused isListSelected isListItemFocused isButtonPressed isPlaybackPosition isRemoteKeyPressed isRequestSucceeded isRequestFailed isRequestInterrupted isStatusMessage isPaused isResumed isCleared isPartialResult isFullResult isAdSelected isStorageDeviceInserted isStorageDeviceRemoved isStreamStarted GetType GetIndex GetMessage GetData GetInfo

" syn keyword brsStatement
" syn keyword brsKeyword As
" syn keyword brsDefine

" Numbers
syn match brsNumber "\<\d\+\>"
syn match brsNumber "\<\d\+\.\d*\>"
syn match brsNumber "\.\d\+\>"
syn match  brsFloat		"[-+]\=\<\d\+[eE][\-+]\=\d\+"
syn match  brsFloat		"[-+]\=\<\d\+\.\d*\([eE][\-+]\=\d\+\)\="
syn match  brsFloat		"[-+]\=\<\.\d\+\([eE][\-+]\=\d\+\)\="

" String and Character contstants
syn region  brsString		start=+"+  end=+"\|$+
syn region  brsComment		start="\(^\|\s\)REM \s*" end="$" contains=brsTodo
syn region  brsComment		start="\(^\|\s\)\'"   end="$" contains=brsTodo
syn match   brsLineNumber	"^\d\+\(\s\|$\)"
syn match   brsTypeSpecifier  "[a-zA-Z0-9][\$%&!#]"ms=s+1
syn match   brsTypeSpecifier  "#[a-zA-Z0-9]"me=e-1

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_brs_syntax_inits")

	if version < 508
		let did_brs_syntax_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	HiLink brsBoolean		Boolean
	HiLink brsLineNumber	Comment
	HiLink brsComment		Comment
	HiLink brsConditional	Conditional
	HiLink brsConst			Constant
	HiLink brsDefine		Constant
	HiLink brsError			Error
	HiLink brsFunction		Identifier
	HiLink brsIdentifier	Identifier
	HiLink brsNumber		Number
	HiLink brsFloat			Float
	HiLink brsMethods		PreProc
	HiLink brsOperator		Operator
	HiLink brsRepeat		Repeat
	HiLink brsString		String
	HiLink brsStatement		Statement
	HiLink brsKeyword		Statement
	HiLink brsEvents		Special
	HiLink brsTodo			Todo
	HiLink brsTypes			Type
	HiLink brsTypeSpecifier	Type

	delcommand HiLink
endif

let b:current_syntax = "brs"

" vim: ts=8
