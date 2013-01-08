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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Leader key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <Leader>tab Toggles NERDTree
map <leader><tab> :NERDTreeToggle<cr>

" <Leader>F: Sync the current buffer with NerdTree
map <leader>f :NERDTreeFind<cr>

" <Leader>N: Clear search highlights
map <leader>n :noh<cr>

" <Leader>W: Save
nmap <leader>w :w<cr>

" <Leader>Q: Quit all
map <leader>q :qa<cr>

" <Leader>P: Copy the full path of the current file to the clipboard
map <leader>p :let @+=expand("%:p")<cr>

" <Leader>1: Toggle between paste mode
set pastetoggle=<leader>1

" <Leader>2: Toggle Tagbar
map <leader>2 :TagbarToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable arrow keys, they're evil
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Ctrl-C, that's a bad habit, use Ctrl-[ or jk instead
imap <c-c> <nop>

" Map jk to escape in insert mode
imap jk <esc>

" Ctrl-[hjkl]: Move in insert mode
imap <c-h> <left>
imap <c-j> <down>
imap <c-k> <up>
imap <c-l> <right>

" Alt-[hjkl]: Move word i insert mode
" TODO This doesn't work when a word is just a single character, how to fix?
inoremap <m-h> <esc>BBEa
inoremap <m-l> <esc>Ea

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

" w! change ro files to rw
function! g:chmodonwrite()
    if v:cmdbang
        silent !chmod u+w %
    endif
endfunction
autocmd bufwrite * call g:chmodonwrite()

" w!! writes using sudo
cmap w!! w !sudo tee % >/dev/null

" Copy and paste to the system clipboard using Ctrl-C and Ctrl-V
" Disable this in normal node since it conflicts with visual block mode
" nmap <c-v> "+gP
imap <c-v> <esc><c-v>i
vmap <c-c> "+y

" Paste to command mode using Ctrl-V
cmap <c-v> <c-r>"

" Select all with Ctrl-A
nmap <c-a> ggvGg_

" Search the highlighted word literally using Ack
vnoremap <leader>sd y:<c-u>Ack -Qu '<c-r>"'<cr>
nnoremap <leader>sd :Ack -Qu '<c-r><c-w>'<cr>

" Search the highlighted word literally on the current buffer using Ack
vnoremap <leader>sf y:<c-u>Ack -Q '<c-r>"' %<cr>
nnoremap <leader>sf :Ack -Q '<c-r><c-w>' %<cr>

" Ctrl-S to save
nmap <c-s> :w<cr>
imap <c-s> <c-o><c-s>

" Remap Ctrl-W to quit
nmap <c-w> :q<cr>

" scroll faster & move cursor too
nnoremap <c-e> 3<c-e>3j
nnoremap <c-y> 3<c-y>3k
vnoremap <c-e> 3<c-e>3j
vnoremap <c-y> 3<c-y>3k

" Go to beginning and end of line quicker
noremap H ^
noremap L $

" keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv

" basic readline shortcuts
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" make backspace work sanely in visual mode
vnoremap <bs> x

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => general
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history vim has to remember
set history=10000

" Set to auto read when a file is changed from the outside
set autoread

" Fast editing of the .vimrc
map <leader>e :e! ~/.dotfiles/.vimrc<cr>

" Reload vimrc when edited, also reload the powerline color
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | call Pl#Load() | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Display unprintable chars
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" the /g flag on :s substitutions by default
set gdefault

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=10

" Disable folding
set nofoldenable
set foldlevel=99999

" Show line number
set number

" Show mode
set showmode

" Auto complete setting
set completeopt=longest,menuone,preview

" Set completion mode. first tab completes as much as possible, second tab shows list of options
set wildmode=longest,list
set wildmenu "turn on wild menu

set hid "change buffer - without saving

" set backspace config
set backspace=eol,start,indent

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

set colorcolumn=+1 " color the text width

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => colors and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "enable syntax hl

" set font according to system
if has("unix")
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
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Restart vim with Ctrl-Alt-R
nmap <C-M-r> :RestartVim<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
map 0 ^

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
smap <M-j> <C-G><M-j>
smap <M-k> <C-G><M-k>
imap <M-j> <esc><M-j>a
imap <M-k> <esc><M-k>a
smap <M-j> <C-G><M-j>
smap <D-j> <M-j>
smap <M-k> <C-G><M-k>
smap <D-k> <M-k>
imap <M-j> <esc><M-j>a
imap <D-j> <M-j>
imap <M-k> <esc><M-k>a
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowBookmarks=1
" only start if no file is specified (this appears to cause powerline to not
" show up correctly inside of tmux for some strange reason. Disable it for now
" autocmd vimenter * if !argc() | NERDTree | wincmd p | endif
" close vim if the only window open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERD Commenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDSpaceDelims=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use the fancy version of Powerline symbols
let g:Powerline_symbols = 'fancy'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic settings
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': ['ruby', 'php'],
            \ 'passive_filetypes': ['puppet'] }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>gb :Gblame<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gp :Git push<cr>
nmap <leader>gr :Gremove<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>gw :Gwrite<cr>

""" Temporarily disabled settings """
" Resize window using shift left and right
" map <S-left> :vertical resize -5<cr>
" map <S-right> :vertical resize +5<cr>

" Recognize single <Esc> immediately, at the expense of arrow keys and function
" keys not working. meh
set noesckeys
" Lower the delay of escaping out of other modes
set timeout timeoutlen=1000 ttimeoutlen=100
