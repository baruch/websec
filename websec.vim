" Vim syntax file
" Language: 	Web Secretary url.list & ignore.list
" Maintainer:	Baruch Even <websec@ev-en.org>
" URL:			With websec itself
" Last Change:	Tue May 13 07:41:52 IDT 2003

" Place this file as ~/.vim/syntax/websec.vim
"
" Then add the following lines to ~/.vimrc
"
" au BufNewFile,BufRead  url.list,ignore.list setf svn

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

syn case ignore
syn keyword urllistCommand  AsciiMarker Auth DateFMT Diff Digest
syn keyword urllistCommand  Email EmailError EmailLink Hicolor Ignore IgnoreURL
syn keyword urllistCommand  MailFrom Name Prefix Program ProgramDigest
syn keyword urllistCommand  Proxy ProxyAuth RandomWait Tmax Tmin
syn keyword urllistCommand  URL UserAgent

syn region	urllistString	start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline
syn region	urllistString	start=+'+ skip=+\\\\\|\\'+ end=+'+ oneline

syn region  urllistEND    start="^\s*__END__" skip="." end="." contains=perlPOD

syn match	urllistComment	"^#.*"
syn match	urllistComment	"\s#.*"ms=s+1

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_svn_syn_inits")
	if version < 508
		let did_svn_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

    HiLink urllistComment	Comment
    HiLink urllistEND		Comment
    HiLink urllistString	String
	HiLink urllistCommand	Statement

	delcommand HiLink
endif

let b:current_syntax = "websec"
