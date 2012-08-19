" I'm going to start re-learning VIM clean this time. Getting rid of most of my existing vimrc configs and try to understands what each one does

" Init pathogen
filetype off
call pathogen#infect()
call pathogen#helptags()

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" disable Ctrl-C, that's a bad habit, use Ctrl-[ or jk instead
map <C-C> <nop>

" map jk to escape
imap jk <esc>

" Map NERDTree
map <F2> :NERDTreeToggle<cr>

" Clear search highlights with F3
map <F3> :noh<cr>

" Toggle Tagbar
map <F4> :TagbarToggle<cr>

" F5 to F7 to switch color schemes
map <F5> :colorscheme zenburn<cr>
map <F6> :colorscheme molokai<cr>
map <F7> :colorscheme desert<cr>

" Map F8 to toggle between paste modes
nmap <F8> :set invpaste paste?<CR>
set pastetoggle=<F8>
set showmode

" Map Ctrl-z to undo in insert mode
imap <C-Z> <esc>ui

" Map Ctrl-n Ctrl-n to toggle line number
nmap <C-N><C-N> :set invnumber<CR>
" Show line number
set number

" Ctrl-n Ctrl-t to open a new tab
nmap <C-N><C-T> :tabnew<cr>
nmap <C-N><C-W> :tabclose<cr>

" Ctrl-Backspace to delete previous word
imap <C-BS> <C-W>

set completeopt=longest,menuone,preview
" map ctrl-space to omni-completion
inoremap <expr> <c-space> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"

" \ to toggle comment using the NERDCommenter
map \ <leader>c<space>

" <leader>f to sync the current buffer with NERDTree
map <leader>f :NERDTreeFind<cr>

let g:NERDTreeWinSize=30

" w! change RO files to RW
function! g:ChmodOnWrite()
  if v:cmdbang
    silent !chmod u+w %
  endif
endfunction

autocmd BufWrite * call g:ChmodOnWrite()

" Auto-change current directory
"autocmd BufEnter * silent! lcd %:p:h

" Copy the full path of the current file to the clipboard
map <leader>p :let @* = expand("%:p")<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.dotfiles/_vimrc<cr>

" When vimrc is edited, reload it
if has("win32")
   autocmd! bufwritepost _vimrc source $HOME/_vimrc
elseif has("unix")
    autocmd! bufwritepost _vimrc source $HOME/.vimrc
endif

" disable folding
set nofoldenable
set foldlevel=99999

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
"set so=7

" Set completion mode. First tab completes as much as possible, second tab shows list of options
set wildmode=longest,list
set wildmenu "Turn on WiLd menu

"set ruler "Always show current position

"set cmdheight=2 "The commandbar height

set hid "Change buffer - without saving

" Set backspace config
"set backspace=eol,start,indent
"set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros 

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set vb

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

" Set font according to system
if has("unix")
    set gfn=Menlo:h12
elseif has("win32")
    set gfn=Consolas:h12
endif
set t_Co=256
colorscheme desert
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
