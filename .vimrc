set runtimepath+=~/.dotfiles/vimfiles

" Init pathogen
call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

" Source google specific settings
try
source ~/.vimrc.google
catch
endtry

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Use the fancy version of Powerline synbols
let g:Powerline_symbols = 'fancy'

" Syntastic settings
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': ['ruby', 'php'],
            \ 'passive_filetypes': ['puppet'] }

" Disable arrow keys, they're evil
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Ctrl-C, that's a bad habit, use Ctrl-[ or jk instead
imap <c-c> <nop>

" map jk to escape
imap jk <esc>

""" Leader keys """
" <Leader>Tab: Toggle NerdTree
map <leader><tab> :NERDTreeToggle<cr>

" <Leader>F: Sync the current buffer with NerdTree
map <leader>f :NERDTreeFind<cr>

" <Leader>N: Clear search highlights
map <leader>n :noh<cr>

" <Leader>W: Save
nmap <leader>w :w<cr>

" <Leader>1: Toggle between paste mode
set pastetoggle=<leader>1

" Toggle Tagbar
map <leader>2 :tagbartoggle<cr>

" Resize window using shift left and right
map <S-left> :vertical resize -5<cr>
map <S-right> :vertical resize +5<cr>

" Ctrl-Z: Undo in insert mode
imap <c-z> <esc>ui

" Ctrl-N Ctrl-N: Toggle line number
nmap <c-n><c-n> :set invnumber<cr>

" Ctrl-N Ctrl-T: Open new tab
nnoremap <c-n><c-t> :tabnew<cr>

" Ctrl-N Ctrl-W: Close tab
nnoremap <c-n><c-w> :tabclose<cr>

" Ctrl-Backspace: Delete previous word
inoremap <c-bs> <c-w>

" \: Toggle comment with Nerdcommenter
map \ <leader>c<space>

" Show line number
set number

" Show mode
set showmode

" Auto complete setting
set completeopt=longest,menuone,preview

let NERDTreeShowBookmarks=1
"let g:nerdtreewinsize=30
" only start if no file is specified
autocmd vimenter * if !argc() | NERDTree | wincmd p | endif
" close vim if the only window open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" w! change ro files to rw
function! g:chmodonwrite()
    if v:cmdbang
        silent !chmod u+w %
    endif
endfunction

autocmd bufwrite * call g:chmodonwrite()

" w!! writes using sudo
cmap w!! w !sudo tee % >/dev/null

" copy the full path of the current file to the clipboard
"map <leader>p :let @*=expand("%:p")<cr>
map <leader>p :let @+=expand("%:p")<cr>

" Copy and paste to the system clipboard using Ctrl-C and Ctrl-V
nmap <C-V> "+gP
imap <C-V> <esc><C-V>i
vmap <C-C> "+y

" Select all with Ctrl-A
nmap <C-A> ggVG

" Paste to command mode using Ctrl-V
cmap <C-V> <C-R>"

" Search the highlighted word literally using Ack
vnoremap <c-s> y:<c-u>Ack -Qu '<c-r>"'<cr>

" Search the highlighted word literally on the current buffer using Ack
vnoremap <leader>s y:<c-u>Ack -Q '<c-r>"' %<cr>

" Ctrl-S to save
nmap <C-S> :w<cr>
imap <C-S> <C-O><C-S>

" Remap Ctrl-W to quit
nmap <C-W> :q<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => general
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sets how many lines of history vim has to remember
set history=10000

" set to auto read when a file is changed from the outside
set autoread

" Fast editing of the .vimrc
map <leader>e :e! ~/.dotfiles/.vimrc<cr>

" Reload vimrc when edited, also reload the powerline color
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | call Pl#Load() | if has('gui_running') | so $MYGVIMRC | endif
augroup END

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" disable folding
set nofoldenable
set foldlevel=99999

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set 7 lines to the curors - when moving vertical..
"set so=7

" set completion mode. first tab completes as much as possible, second tab shows list of options
set wildmode=longest,list
set wildmenu "turn on wild menu

"set ruler "always show current position

"set cmdheight=2 "the commandbar height

set hid "change buffer - without saving

" set backspace config
set backspace=eol,start,indent
"set whichwrap+=<,>,h,l

set ignorecase "ignore case when searching
set smartcase

set hlsearch "highlight search things

set incsearch "make search act like search in modern browsers
set nolazyredraw "don't redraw while executing macros 

set magic "set magic on, for regular expressions

set showmatch "show matching bracets when text indicator is over them
set mat=2 "how many tenths of a second to blink

" no sound on errors
set vb
set t_vb=

set nocompatible   " disable vi-compatibility
set laststatus=2   " always show the statusline
set encoding=utf-8 " necessary to show unicode glyphs

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => colors and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "enable syntax hl

" set font according to system
if has("unix")
    "set gfn=Menlo\ for\ Powerline\ 12
    set gfn=Ubuntu\ Mono\ for\ Powerline\ 12
elseif has("macunix")
    set gfn=menlo\ for\ powerline:h12
elseif has("win32")
    set gfn=consolas:h12
endif
set t_co=256
colorscheme desert-warm-256
" disable menu and toolbar
set go-=T
set go-=m

set encoding=utf8
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=2
set tabstop=8
set softtabstop=2
set smarttab

set lbr
set tw=80

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?
map <silent> <leader><cr> :noh<cr>

" Smart way to move btw. windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
map 0 ^

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <D-j> <M-j>
nmap ^[j mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
nmap <D-k> <M-k>
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <D-j> <M-j>
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
vmap <D-k> <M-k>
smap <M-j> <C-G><M-j>
smap <D-j> <M-j>
smap <M-k> <C-G><M-k>
smap <D-k> <M-k>
imap <M-j> <esc><M-j>i
imap <D-j> <M-j>
imap <M-k> <esc><M-k>i
imap <D-k> <M-k>

"Copy a line using Ctrl-Alt-j
nmap <C-M-j> yyp

set guitablabel=%t

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
