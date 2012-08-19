" Vim color file
" Original Author: Henry So, Jr. <henryso@panix.com>
" Maintainer: Rainux Luo <rainux@gmail.com>
" URL: https://github.com/rainux/vim-desert-warm-256

" It's a color scheme for Vim, based on the "desert" color scheme by Hans
" Fugal with a few small tweaks. The tweaks are try to make it looks a bit
" warm and be more friendly for my eyes. Using the code from "desert256" to
" make the gui highlight definitions also work with 88 and 256-color xterms.
"
" The original "desert" theme is available as part of the vim distribution or
" at http://hans.fugal.net/vim/colors/.
"
" The "desert256" theme is available at
" http://www.vim.org/scripts/script.php?script_id=1243.
"
" The real feature of this color scheme, with a wink to the "inkpot" theme, is
" the programmatic approximation of the gui colors to the palettes of 88- and
" 256- color xterms.  The functions that do this (folded away, for
" readability) are calibrated to the colors used for Thomas E. Dickey's xterm
" (version 200), which is available at http://dickey.his.com/xterm/xterm.html.
"
" Support rgb color names from rgb.txt file. Use a Ruby script to pre-parse
" rgb.txt then convert color names mapping to a Vim dictionary, store it in
" colors/rgb_colors file.
"
" Consider use this color scheme as infrastructure to create new color
" schemes. The benefit is your color schemes will looks nearly the same both
" in gVim and Vim running in 256- color xterms, without any additional effort.

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists('syntax_on')
        syntax reset
    endif
endif
let g:colors_name='desert-warm-256'

exec 'source ' . expand('<sfile>:p:h') . '/rgb_colors'

if has('gui_running') || &t_Co == 88 || &t_Co == 256
    " functions {{{
    " returns an approximate grey index for the given grey level
    fun <SID>grey_number(x)
        if &t_Co == 88
            if a:x < 23
                return 0
            elseif a:x < 69
                return 1
            elseif a:x < 103
                return 2
            elseif a:x < 127
                return 3
            elseif a:x < 150
                return 4
            elseif a:x < 173
                return 5
            elseif a:x < 196
                return 6
            elseif a:x < 219
                return 7
            elseif a:x < 243
                return 8
            else
                return 9
            endif
        else
            if a:x < 14
                return 0
            else
                let l:n = (a:x - 8) / 10
                let l:m = (a:x - 8) % 10
                if l:m < 5
                    return l:n
                else
                    return l:n + 1
                endif
            endif
        endif
    endfun

    " returns the actual grey level represented by the grey index
    fun <SID>grey_level(n)
        if &t_Co == 88
            if a:n == 0
                return 0
            elseif a:n == 1
                return 46
            elseif a:n == 2
                return 92
            elseif a:n == 3
                return 115
            elseif a:n == 4
                return 139
            elseif a:n == 5
                return 162
            elseif a:n == 6
                return 185
            elseif a:n == 7
                return 208
            elseif a:n == 8
                return 231
            else
                return 255
            endif
        else
            if a:n == 0
                return 0
            else
                return 8 + (a:n * 10)
            endif
        endif
    endfun

    " returns the palette index for the given grey index
    fun <SID>grey_color(n)
        if &t_Co == 88
            if a:n == 0
                return 16
            elseif a:n == 9
                return 79
            else
                return 79 + a:n
            endif
        else
            if a:n == 0
                return 16
            elseif a:n == 25
                return 231
            else
                return 231 + a:n
            endif
        endif
    endfun

    " returns an approximate color index for the given color level
    fun <SID>rgb_number(x)
        if &t_Co == 88
            if a:x < 69
                return 0
            elseif a:x < 172
                return 1
            elseif a:x < 230
                return 2
            else
                return 3
            endif
        else
            if a:x < 75
                return 0
            else
                let l:n = (a:x - 55) / 40
                let l:m = (a:x - 55) % 40
                if l:m < 20
                    return l:n
                else
                    return l:n + 1
                endif
            endif
        endif
    endfun

    " returns the actual color level for the given color index
    fun <SID>rgb_level(n)
        if &t_Co == 88
            if a:n == 0
                return 0
            elseif a:n == 1
                return 139
            elseif a:n == 2
                return 205
            else
                return 255
            endif
        else
            if a:n == 0
                return 0
            else
                return 55 + (a:n * 40)
            endif
        endif
    endfun

    " returns the palette index for the given R/G/B color indices
    fun <SID>rgb_color(x, y, z)
        if &t_Co == 88
            return 16 + (a:x * 16) + (a:y * 4) + a:z
        else
            return 16 + (a:x * 36) + (a:y * 6) + a:z
        endif
    endfun

    " returns the palette index to approximate the given R/G/B color levels
    fun <SID>color(r, g, b)
        " get the closest grey
        let l:gx = <SID>grey_number(a:r)
        let l:gy = <SID>grey_number(a:g)
        let l:gz = <SID>grey_number(a:b)

        " get the closest color
        let l:x = <SID>rgb_number(a:r)
        let l:y = <SID>rgb_number(a:g)
        let l:z = <SID>rgb_number(a:b)

        if l:gx == l:gy && l:gy == l:gz
            " there are two possibilities
            let l:dgr = <SID>grey_level(l:gx) - a:r
            let l:dgg = <SID>grey_level(l:gy) - a:g
            let l:dgb = <SID>grey_level(l:gz) - a:b
            let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
            let l:dr = <SID>rgb_level(l:gx) - a:r
            let l:dg = <SID>rgb_level(l:gy) - a:g
            let l:db = <SID>rgb_level(l:gz) - a:b
            let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
            if l:dgrey < l:drgb
                " use the grey
                return <SID>grey_color(l:gx)
            else
                " use the color
                return <SID>rgb_color(l:x, l:y, l:z)
            endif
        else
            " only one possibility
            return <SID>rgb_color(l:x, l:y, l:z)
        endif
    endfun

    " returns the palette index to approximate the 'rrggbb' hex string
    fun <SID>rgb(rgb)
        let l:r = ('0x' . strpart(a:rgb, 0, 2)) + 0
        let l:g = ('0x' . strpart(a:rgb, 2, 2)) + 0
        let l:b = ('0x' . strpart(a:rgb, 4, 2)) + 0

        return <SID>color(l:r, l:g, l:b)
    endfun

    " sets the highlighting for the given group
    " call <SID>X(group, fg, bg, attr), bg and attr are optional
    fun <SID>X(group, fg, ...)
        if a:fg != ''
            let fg = tolower(a:fg)
            let fg_hex = has_key(g:rgb_colors, fg) ? g:rgb_colors[fg] : a:fg
            exec 'hi ' . a:group . ' guifg=#' . fg_hex . ' ctermfg=' . <SID>rgb(fg_hex)
        endif
        if a:0 > 0 && a:1 != ''
            let bg = tolower(a:1)
            let bg_hex = has_key(g:rgb_colors, bg) ? g:rgb_colors[bg] : bg
            exec 'hi ' . a:group . ' guibg=#' . bg_hex . ' ctermbg=' . <SID>rgb(bg_hex)
        endif
        if a:0 > 1 && a:2 != ''
            let attr = a:2
            exec 'hi ' . a:group . ' gui=' . attr . ' cterm=' . attr
        endif
    endfun
    " }}}

    call <SID>X('Normal', 'white', 'grey20')

    " highlight groups
    call <SID>X('Cursor', 'khaki', 'indianred')
    "CursorIM
    "Directory
    "DiffAdd
    "DiffChange
    "DiffDelete
    "DiffText
    "ErrorMsg
    call <SID>X('VertSplit', 'grey50', 'c2bfa5', 'none')
    call <SID>X('Folded', 'orange', 'grey30')
    call <SID>X('FoldColumn', 'tan', 'grey14')
    call <SID>X('IncSearch', 'slategrey', 'khaki')
    call <SID>X('LineNr', 'grey70', 'grey17')
    call <SID>X('ModeMsg', 'goldenrod')
    call <SID>X('MoreMsg', 'seagreen')
    "call <SID>X('NonText', 'lightblue', 'grey14', 'bold')
    call <SID>X('NonText', 'lightblue', 'grey20', 'bold')
    call <SID>X('Question', 'springgreen')
    call <SID>X('Search', 'dfffdf', 'grey30')
    call <SID>X('SpecialKey', 'yellowgreen')
    call <SID>X('StatusLine', 'grey90', 'grey17', 'none')
    call <SID>X('StatusLineNC', 'grey40', 'grey17', 'none')
    call <SID>X('Title', 'indianred')
    call <SID>X('Visual', 'khaki', 'olivedrab', 'none')
    "VisualNOS
    call <SID>X('WarningMsg', 'salmon', '', '')
    "WildMenu
    "Menu
    call <SID>X('Pmenu', 'grey80', 'grey10')
    call <SID>X('PmenuSel', 'grey80', 'grey25')
    "Scrollbar
    "Tooltip
    call <SID>X('MatchParen', 'dfffdf', 'grey30')

    " syntax highlighting groups
    call <SID>X('Comment', 'skyblue')
    call <SID>X('Constant', 'ffa0a0')
    call <SID>X('String', 'e0a5da')
    call <SID>X('Identifier', 'palegreen', '', 'none')
    call <SID>X('Statement', 'ffd797', '', 'bold')
    call <SID>X('PreProc', 'indianred')
    call <SID>X('Type', 'e9b96e', '', 'bold')
    call <SID>X('Special', 'navajowhite')
    "Underlined
    call <SID>X('Ignore', 'grey40')
    "Error
    call <SID>X('Todo', 'orangered', 'yellow2')

    " delete functions {{{
    delf <SID>X
    delf <SID>rgb
    delf <SID>color
    delf <SID>rgb_color
    delf <SID>rgb_level
    delf <SID>rgb_number
    delf <SID>grey_color
    delf <SID>grey_level
    delf <SID>grey_number
    " }}}
else
    " color terminal definitions
    hi SpecialKey    ctermfg=darkgreen
    hi NonText       cterm=bold ctermfg=darkblue
    hi Directory     ctermfg=darkcyan
    hi ErrorMsg      cterm=bold ctermfg=7 ctermbg=1
    hi IncSearch     cterm=NONE ctermfg=yellow ctermbg=green
    hi Search        cterm=NONE ctermfg=grey ctermbg=blue
    hi MoreMsg       ctermfg=darkgreen
    hi ModeMsg       cterm=NONE ctermfg=brown
    hi LineNr        ctermfg=3
    hi Question      ctermfg=green
    hi StatusLine    cterm=bold,reverse
    hi StatusLineNC  cterm=reverse
    hi VertSplit     cterm=reverse
    hi Title         ctermfg=5
    hi Visual        cterm=reverse
    hi VisualNOS     cterm=bold,underline
    hi WarningMsg    ctermfg=1
    hi WildMenu      ctermfg=0 ctermbg=3
    hi Folded        ctermfg=darkgrey ctermbg=NONE
    hi FoldColumn    ctermfg=darkgrey ctermbg=NONE
    hi DiffAdd       ctermbg=4
    hi DiffChange    ctermbg=5
    hi DiffDelete    cterm=bold ctermfg=4 ctermbg=6
    hi DiffText      cterm=bold ctermbg=1
    hi Comment       ctermfg=darkcyan
    hi Constant      ctermfg=brown
    hi Special       ctermfg=5
    hi Identifier    ctermfg=6
    hi Statement     ctermfg=3
    hi PreProc       ctermfg=5
    hi Type          ctermfg=2
    hi Underlined    cterm=underline ctermfg=5
    hi Ignore        ctermfg=darkgrey
    hi Error         cterm=bold ctermfg=7 ctermbg=1
endif

" vim: set fdl=0 fdm=marker sts=4 sw=4:
