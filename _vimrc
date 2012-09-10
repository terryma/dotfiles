" I'm going to start re-learning VIM clean this time. Getting rid of most of my existing vimrc configs and try to understands what each one does

" Init pathogen
filetype off
call pathogen#infect()
call pathogen#helptags()

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

let g:Powerline_symbols = 'fancy'

" Syntastic settings
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': ['ruby', 'php'],
            \ 'passive_filetypes': ['puppet'] }

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" disable Ctrl-C, that's a bad habit, use Ctrl-[ or jk instead
map <C-C> <nop>

" map jk to escape
imap jk <esc>

" Map NERDTree
map <F2> :NERDTreeToggle<cr>
map <leader><tab> :NERDTreeToggle<cr>

" Resize window using shift left and right
map <S-left> :vertical resize -5<cr>
map <S-right> :vertical resize +5<cr>

" Clear search highlights with F3
map <F3> :noh<cr>

" Toggle Tagbar
map <F4> :TagbarToggle<cr>

" F5 to F7 to switch color schemes
map <F5> :colorscheme zenburn<cr>
map <F6> :colorscheme molokai<cr>
map <f7> :colorscheme desert-warm-256<cr>

" toggle between paste mode
set pastetoggle=<leader>1
set showmode

" map ctrl-z to undo in insert mode
imap <c-z> <esc>ui

" map ctrl-n ctrl-n to toggle line number
nmap <c-n><c-n> :set invnumber<cr>
" show line number
set number

" ctrl-n ctrl-t to open a new tab
nmap <c-n><c-t> :tabnew<cr>
nmap <c-n><c-w> :tabclose<cr>

" ctrl-backspace to delete previous word
imap <c-bs> <c-w>

set completeopt=longest,menuone,preview
" map ctrl-space to omni-completion
inoremap <expr> <c-space> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"

" \ to toggle comment using the nerdcommenter
map \ <leader>c<space>

" <leader>f to sync the current buffer with nerdtree
map <leader>f :NERDTreeFind<cr>
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

" auto-change current directory
"autocmd bufenter * silent! lcd %:p:h

" copy the full path of the current file to the clipboard
map <leader>p :let @* = expand("%:p")<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => general
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sets how many lines of history vim has to remember
set history=700

" enable filetype plugin
filetype plugin on
filetype indent on

" set to auto read when a file is changed from the outside
set autoread

" fast saving
nmap <leader>w :w!<cr>

" fast editing of the .vimrc
map <leader>e :e! ~/.dotfiles/_vimrc<cr>

" when vimrc is edited, reload it
autocmd! bufwritepost _vimrc source $HOME/.dotfiles/_vimrc

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

set nocompatible   " disable vi-compatibility
set laststatus=2   " always show the statusline
set encoding=utf-8 " necessary to show unicode glyphs

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => colors and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "enable syntax hl

" set font according to system
if has("unix")
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
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500

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
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

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
nmap <M-Down> <M-j>
nmap <M-k> mz:m-2<cr>`z
nmap <D-k> <M-k>
nmap <M-Up> <M-k>
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <D-j> <M-j>
vmap <M-Down> <M-j>
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
vmap <D-k> <M-k>
vmap <M-Up> <M-k>
smap <M-j> <C-G><M-j>
smap <D-j> <M-j>
smap <M-Down> <M-j>
smap <M-k> <C-G><M-k>
smap <D-k> <M-k>
smap <M-Up> <M-k>
imap <M-j> <C-O><M-j>
imap <D-j> <M-j>
imap <M-Down> <M-j>
imap <M-k> <C-O><M-k>
imap <D-k> <M-k>
imap <M-Up> <M-k>
"Copy a line using Ctrl-Alt-down or Ctrl-Alt-j
nmap <C-M-Down> yyp
imap <C-M-Down> <esc><C-M-Down>i
nmap <C-M-j> yyp
imap <C-M-Up> <esc><C-M-Up>i


set guitablabel=%t


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


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

""""""""""""""""""""""""""""""
" => Command-T
""""""""""""""""""""""""""""""
let g:CommandTMaxHeight = 20
set wildignore+=*.o,*.obj,.git,*.pyc,*.class,*.LCK,*.pdf
noremap <leader>y :CommandTFlush<cr>
"map <S-T> :CommandT<cr>
"map <leader>t :CommandT<cr>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH
