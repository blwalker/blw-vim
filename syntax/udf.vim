" Vim syntax file
" Language:	DSXQI Stored Procedure/Function
" Maintainer:	Brandon Gabbert
" Last Change:	Thu Apr 22 2010

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Almost always uppercase, but allow either
syn case ignore

" UDF definition keywords
syn keyword udfStatement	PROCEDURE FUNCTION
syn keyword udfStatement	RETURNS
syn keyword udfStatement	DESCRIPTION
syn keyword udfStatement	AUTHOR
syn keyword udfStatement	COMPILER OPTIONS
syn keyword udfStatement	SPECIFIC
syn keyword udfStatement	LANGUAGE SQL IMS BASIC CPP
syn keyword udfStatement	PARAMETER STYLE SQL GENERAL
syn keyword udfStatement	NOT DETERMINISTIC
syn keyword udfStatement	NOT PERSISTENT
syn keyword udfStatement	READS MODIFIES NO SQL DATA
syn keyword udfStatement	CALL RETURNS NULL ON INPUT
syn keyword udfStatement	STATIC DISPATCH
syn match   udfStatement	"CONTAINS"

" Data types
syn keyword udfDataType		BLOB
syn keyword udfDataType		BIT
syn keyword udfDataType		BIT_VARYING
syn keyword udfDataType		CHAR
syn keyword udfDataType		VARCHAR
syn keyword udfDataType		NCHAR
syn keyword udfDataType		NVARCHAR
syn keyword udfDataType		CLOB
syn keyword udfDataType		NCLOB
syn keyword udfDataType		DATE
syn keyword udfDataType		TIME
syn keyword udfDataType		TIME_WITH_TIME_ZONE
syn keyword udfDataType		TIMESTAMP
syn keyword udfDataType		TIMESTAMP_WITH_TIME_ZONE
syn keyword udfDataType		INTERVAL
syn keyword udfDataType		BOOLEAN
syn keyword udfDataType		SMALLINT
syn keyword udfDataType		INT
syn keyword udfDataType		NUMERIC
syn keyword udfDataType		DEC
syn keyword udfDataType		FLOAT
syn keyword udfDataType		REAL
syn keyword udfDataType		DOUBLE_PRECISION
syn keyword udfDataType		NUMERIC_STRING
syn keyword udfDataType		PADDED_NUMERIC_STRING
syn keyword udfDataType		DATE_STRING
syn keyword udfDataType		TTIME

" Data attributes
syn keyword udfStatement	IS NOT NULL
syn keyword udfStatement	DEFAULT
syn keyword udfStatement	CHECK
syn keyword udfStatement	DESC
syn keyword udfStatement	FORMAT

syn match   udfNumber		"\<\d\+\>"
syn match   udfNumber		"\<\d\+\.\d*\>"
syn match   udfNumber		"\.\d\+\>"

" String and Character constants
syn region  udfString		start='"'  skip='""'  end='"'
syn region  udfString		start="'"  skip="''"  end="'"
syn match   udfNormal		"@\w*"

" Nested C++ or IMS BASIC
syn region  udfStatement	start="\<AS"  end="\%$"  contains=udfNested
syn region  udfNested		start='"'  skip='""'  end='"'  contains=@Nested  contained
syn region  udfNested		start="'"  skip="''"  end="'"  contains=@Nested  contained

if search("\\cLANGUAGE CPP")
  syn include @Nested	syntax/cpp.vim
elseif search("\\cLANGUAGE IMS BASIC") || search("\\cLANGUAGE BASIC")
  syn include @Nested	syntax/basic.vim
endif

" Always scan the whole file, as most of it will be a nested region
syn sync fromstart

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_udf_syntax_inits")
  if version < 508
    let did_udf_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink udfStatement		Statement
  HiLink udfDatatype		Type
  HiLink udfNumber		Number
  HiLink udfString		String
  HiLink udfIdentifier		Identifier
  HiLink udfNormal		Normal
  HiLink udfNested		Normal

  delcommand HiLink
endif

let b:current_syntax = "udf"

" vim: ts=8
