" Vim syntax file
" Language: dc (desktop calculator)
" Maintainer: Brian Hefele - brhefele at brainaxle.com
" Latest Revision: 03 May 2010
"
" Important note: this was written to support the way I code dc.
" The big problem with highlighting dc (IMO) is that of macros.
" Macros are stored in strings, with no clear way to delineate what a string
" may or may not be used for later on. Or, at least, no prescribed way.
" So, I need to prescribe my own way. Basically, everything inside [] is
" interpreted as a string, unless the string is followed by an execute
" command (x) OR a save command and a newline (s.\n)
" This allows me to use macros as functions, and for the sake of tidiness,
" I keep all functions on their own lines. I assume, then, that a []sx in
" The middle of the line is just a string being saved for later. I make
" a lot of assumptions. And I may change this later to allow for 
" some variables to be set depending on a user's usage. For instance,
" I also set load/save register operations to a specific highlight. But
" if you load a register to execute, including as part of a conditional,
" the whole operation changes to a different highlight (that for execute).
"
" So again, this won't work for everyone. It might not work for anyone
" except me, really, since who uses dc these days anyway? But if you have
" any issues, suggestions, I welcome any and all emails on the subject.
"

if exists("b:current_syntax")
  finish
endif

syn match dcCommand "[pnPfiokxqQ]"
syn match dcNumber "[0-9_]"
syn match dcStack "[-+/*%~^|vcdrZXzIOK?a]"

syn match dcExec "[x?]"

syn match dcReg "\(s.\|l.\|S.\|L.\)"

syn match dcArray "\(:.\|;.\)"

syn match dcExec "\(\(l.x\|=.\|!=.\|<.\|!<.\|>.\|!>.\)\|l.\(l.x\|=.\|!=.\|<.\|!<.\|>.\|!>.\)\)"

syn match dcFunc2 "\v[\[|\]]"

syn match dcString "\v\[.+\]" contains=@spell

syn match dcFunc "\v(\[.+\]s.\n|\[.+\]x)" contains=NONE,dcCommand,dcNumber,dcStack,dcExec,dcReg,dcArray,dcFunc2 transparent

syn match dcShell "!.*$"

syn match dcComment "#.*$" contains=@spell

hi def link dcCommand Statement
hi def link dcComment Comment
hi def link dcNumber Constant
hi def link dcStack Constant
hi def link dcExec Special
hi def link dcExecX Special
hi def link dcReg Operator
hi def link dcArray Operator
hi def link dcFunc Operator
hi def link dcFunc2 Operator
hi def link dcString String
hi def link dcShell PreProc

let b:currentsyntax = "dc"
