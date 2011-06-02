syntax match date "^\S\+ \S\+ \d\+ \d\+:\d\+:\d\+ \d\+ \S\+ " nextgroup=app
syntax match app "\S\+ " contained nextgroup=machine
syntax match machine "\S\+ "he=e-1 contained nextgroup=brackets
syntax region brackets start="\[" end=" " contained contains=_debug,_info,_warn,_error,_fatal nextgroup=thread
syntax match _debug "\[DEBUG\]" contained
syntax match _info  "\[INFO\]"  contained
syntax match _warn  "\[WARN\]"  contained
syntax match _error "\[ERROR\]" contained
syntax match _fatal "\[FATAL\]" contained
syntax match thread "\S\+ " contained nextgroup=file
syntax match file "\S\+" contained

highlight date    cterm=bold      ctermfg=108  ctermbg=237 gui=bold guifg=#dfdfdf guibg=bg
highlight link app Constant
highlight machine cterm=underline ctermfg=109  guifg=#93b3a3
highlight thread                  ctermfg=12   gui=undercurl guifg=#8c8cbc guisp=#6c6c9c
highlight file                    ctermfg=228  guifg=#efef8f
highlight _debug  cterm=bold ctermfg=187 gui=bold guifg=#dfdfbf
highlight _info   cterm=bold ctermfg=108 gui=bold guifg=#dfdfdf
highlight _warn   cterm=bold ctermfg=13  ctermbg=237 gui=undercurl guifg=#bc8cbc guisp=#bc6c9c
highlight _error  cterm=bold ctermfg=9   ctermbg=237 gui=bold guifg=#dc8c6c guisp=#bc6c4c
highlight _fatal  cterm=bold ctermfg=190

let b:current_syntax = 'error_log'
