" Vim syntax file
" Language:	IMS BASIC
" Maintainer:	Brandon Gabbert
" Last Change:	Wed Apr 21 2010

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" IMS BASIC is case insensitive
syn case ignore

" Constants
syn keyword basicConstant	TRUE
syn keyword basicConstant	FALSE
syn keyword basicStatement	AND
syn keyword basicStatement	OR

" Statements and Functions
syn keyword basicFunction	ABS
syn keyword basicStatement	AS
syn keyword basicFunction	ASC
syn keyword basicStatement	BLOCK
syn keyword basicStatement	BUILD
syn keyword basicStatement	CALL
syn keyword basicStatement	CHAIN
syn keyword basicStatement	CHDIR
syn keyword basicFunction	CHF
syn keyword basicFunction	CHR
syn keyword basicStatement	CLOSE
syn keyword basicStatement	CONST
syn keyword basicFunction	COS
syn keyword basicStatement	DATA
syn keyword basicStatement	DEF
syn keyword basicStatement	DIM
syn keyword basicFunction	DTCHECK
syn keyword basicFunction	DTDAY$
syn keyword basicFunction	DTFORMAT$
syn keyword basicFunction	DTMONTH$
syn keyword basicFunction	DTNOW
syn keyword basicFunction	DTPART
syn keyword basicFunction	DTSERIAL
syn keyword basicFunction	DTVALUE
syn keyword basicStatement	ELSE
syn keyword basicStatement	END
syn keyword basicStatement	ENDDEF
syn keyword basicStatement	ENDIF
syn keyword basicStatement	ENTER
syn keyword basicStatement	ERR
syn keyword basicFunction	EXP
syn keyword basicStatement	FOR
syn keyword basicFunction	FRA
syn keyword basicStatement	GDIM
syn keyword basicStatement	GET
syn keyword basicStatement	GOSUB
syn keyword basicStatement	GOTO
syn keyword basicStatement	IF
syn keyword basicStatement	INCLUDE
syn keyword basicStatement	INPUT
syn keyword basicFunction	INT
syn keyword basicFunction	IXR
syn keyword basicFunction	KEY
syn keyword basicStatement	KILL
syn keyword basicFunction	LEN
syn keyword basicStatement	LET
syn keyword basicFunction	LOG
syn keyword basicFunction	MAN
syn keyword basicStatement	MAT
syn keyword basicStatement	NEXT
syn keyword basicFunction	NOT
syn keyword basicStatement	ON
syn keyword basicStatement	OPEN
syn keyword basicFunction	POS
syn keyword basicStatement	PRINT
syn keyword basicStatement	RANDOM
syn keyword basicStatement	READ
syn keyword basicStatement	RESTOR
syn keyword basicStatement	RETURN
syn keyword basicFunction	RND
syn keyword basicStatement	SEARCH
syn keyword basicFunction	SGN
syn keyword basicStatement	SIGNAL
syn keyword basicFunction	SIN
syn keyword basicFunction	SIZEOF
syn keyword basicStatement	SPAWN
syn keyword basicFunction	SPC
syn keyword basicFunction	SQR
syn keyword basicStatement	STEP
syn keyword basicStatement	STOP
syn keyword basicStatement	SUSPEND
syn keyword basicStatement	SWAP
syn keyword basicStatement	SYSTEM
syn keyword basicFunction	TAN
syn keyword basicStatement	TIM
syn keyword basicFunction	TMADD
syn keyword basicFunction	TMCHECK
syn keyword basicFunction	TMNOW
syn keyword basicFunction	TMSERIAL
syn keyword basicFunction	TMVALUE
syn keyword basicStatement	TO
syn keyword basicStatement	TRAP
syn keyword basicStatement	USING
syn keyword basicFunction	VAL
syn keyword basicStatement	WEND
syn keyword basicStatement	WHILE
syn keyword basicStatement	WRITE

" Named CALL
syn match   basicCall		"\$ATOE"
syn match   basicCall		"\$BOX"
syn match   basicCall		"\$CHECK"
syn match   basicCall		"\$CHKCHNL"
syn match   basicCall		"\$CHKLOCK"
syn match   basicCall		"\$CHNLNO"
syn match   basicCall		"\$CHSTAT"
syn match   basicCall		"\$CONVERT"
syn match   basicCall		"\$DATE"
syn match   basicCall		"\$DD"
syn match   basicCall		"\$DPRESET"
syn match   basicCall		"\$DSCLEAR"
syn match   basicCall		"\$DSELECT"
syn match   basicCall		"\$DSETUP"
syn match   basicCall		"\$ECHO"
syn match   basicCall		"\$EDITOR"
syn match   basicCall		"\$EFLAG"
syn match   basicCall		"\$ENV"
syn match   basicCall		"\$ETOA"
syn match   basicCall		"\$EVENT"
syn match   basicCall		"\$EXECUTE"
syn match   basicCall		"\$FIELD"
syn match   basicCall		"\$FIELDVAL"
syn match   basicCall		"\$FINDF"
syn match   basicCall		"\$FOCUS"
syn match   basicCall		"\$IMSQU"
syn match   basicCall		"\$IMSQVI"
syn match   basicCall		"\$INITBUF"
syn match   basicCall		"\$INPBUF"
syn match   basicCall		"\$INPEDIT"
syn match   basicCall		"\$LEO"
syn match   basicCall		"\$LOCK"
syn match   basicCall		"\$LOGIC"
syn match   basicCall		"\$MONITOR"
syn match   basicCall		"\$MOUSE"
syn match   basicCall		"\$MSG"
syn match   basicCall		"\$MTMASK"
syn match   basicCall		"\$PACK"
syn match   basicCall		"\$PCORE"
syn match   basicCall		"\$POSTMSG"
syn match   basicCall		"\$PREC"
syn match   basicCall		"\$READBUF"
syn match   basicCall		"\$READREF"
syn match   basicCall		"\$REDIR"
syn match   basicCall		"\$RENAME"
syn match   basicCall		"\$RSPCS"
syn match   basicCall		"\$SCRDUMP"
syn match   basicCall		"\$SELCLR"
syn match   basicCall		"\$SELECT"
syn match   basicCall		"\$SELSETUP"
syn match   basicCall		"\$SENDMSG"
syn match   basicCall		"\$SETRAW"
syn match   basicCall		"\$SOCKET"
syn match   basicCall		"\$STRING"
syn match   basicCall		"\$STRSRCH"
syn match   basicCall		"\$SWAPF"
syn match   basicCall		"\$SYSRC"
syn match   basicCall		"\$TIME"
syn match   basicCall		"\$TIMER"
syn match   basicCall		"\$TRACK"
syn match   basicCall		"\$TRXCO"
syn match   basicCall		"\$VOLLINK"
syn match   basicCall		"\$WINDOW"
syn match   basicCall		"\$WRITEBUF"
syn match   basicCall		"\$XMODEM"

syn keyword basicTodo		contained TODO
syn region  basicComment	start="\<REM\>"  end="$"  contains=basicTodo
syn region  basicComment        start="!"  end="$"  contains=basicTodo
syn region  basicLineNumber	start="^\s*\d"  end="\s"

syn match   basicSpecial 	contained "\\\d\d\d\\\|\\."
syn region  basicString		start='"'  skip='\\\\\|\\"'  end='"'  contains=basicSpecial

syn match   basicNumber		"\<\d\+\>"
syn match   basicNumber		"\<\d\+\.\d*\>"
syn match   basicNumber		"\.\d\+\>"

syn match   basicTypeSpecifier  "\<[a-z][a-z0-9_]*[\$%!]"ms=e
syn match   basicTypeSpecifier	"\(\<[1-4]\)\@!%"ms=e
syn match   basicFilenumber	"#\(\d+\)\@!"
syn match   basicMathOperator	"-\|=\|[:<>+\*^/\\]"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_basic_syntax_inits")
  if version < 508
    let did_basic_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink basicConstant		Constant
  HiLink basicStatement		Statement
  HiLink basicFunction		Identifier
  HiLink basicCall		Identifier
  HiLink basicTodo		Todo
  HiLink basicComment		Comment
  HiLink basicLineNumber	Comment
  HiLink basicSpecial		Special
  HiLink basicString		String
  HiLink basicNumber		Number
  HiLink basicTypeSpecifier	Type
  HiLink basicFilenumber	Type
  HiLink basicMathOperator	Operator

  delcommand HiLink
endif

let b:current_syntax = "basic"

" vim: ts=8
