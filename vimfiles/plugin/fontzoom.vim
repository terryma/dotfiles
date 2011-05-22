" The fontsize controller in gVim.
" Version: 0.1.1
" Author : thinca <thinca+vim@gmail.com>
" License: Creative Commons Attribution 2.1 Japan License
"          <http://creativecommons.org/licenses/by/2.1/jp/deed.en>

if exists('g:loaded_fontzoom') || !has('gui_running')
  finish
endif
let g:loaded_fontzoom = 1

let s:save_cpo = &cpo
set cpo&vim


function! s:fontzoom(size, reset)
  if a:reset
    if exists('s:keep')  " Reset font size.
      let [&guifont, &lines, &columns] = s:keep
      unlet! s:keep
    endif
  elseif a:size == ''
    echo matchstr(&guifont, g:fontzoom_pattern)
  else
    let size = (a:size =~ '^[+-]' ? 'submatch(0)' : '') . a:size
    if !exists('s:keep')
      let s:keep = [&guifont, &lines, &columns]
    endif
    let &guifont = join(map(split(&guifont, '\\\@<!,'),
    \   printf('substitute(v:val, %s, %s, "g")',
    \   string(g:fontzoom_pattern),
    \   string('\=max([1,' . size . '])'))), ',')
    " Keep window size if possible.
    let [&lines, &columns] = s:keep[1:]
  endif
endfunction



if !exists('g:fontzoom_pattern')
  " TODO: X11 is not tested because I do not have the environment.
  let g:fontzoom_pattern =
  \   has('win32') || has('win64') ||
  \   has('mac') || has('macunix') ? ':h\zs\d\+':
  \   has('gui_gtk')               ? '\s\+\zs\d\+$':
  \   has('X11')                   ? '\v%([^-]*-){6}\zs\d+\ze%(-[^-]*){7}':
  \                                  '*Unknown system*'
endif


" Commands.
command! -narg=? -bang -bar Fontzoom call s:fontzoom(<q-args>, <bang>0)

" Key mappings.
nnoremap <silent> <Plug>(fontzoom-larger)
\                 :<C-u>Fontzoom +<C-r>=v:count1<CR><CR>
nnoremap <silent> <Plug>(fontzoom-smaller)
\                 :<C-u>Fontzoom -<C-r>=v:count1<CR><CR>

if !exists('g:fontzoom_no_default_key_mappings')
\  || !g:fontzoom_no_default_key_mappings
  silent! nmap <unique> <silent> + <Plug>(fontzoom-larger)
  silent! nmap <unique> <silent> - <Plug>(fontzoom-smaller)
  silent! nmap <unique> <silent> <C-ScrollWheelUp> <Plug>(fontzoom-larger)
  silent! nmap <unique> <silent> <C-ScrollWheelDown> <Plug>(fontzoom-smaller)
endif

let &cpo = s:save_cpo
unlet s:save_cpo
