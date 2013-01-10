""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pathogen
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.dotfiles/.vim/bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Google specific settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
source ~/.vimrc.google
catch
endtry

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Leader key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map leader key to comma
let mapleader = ","
let g:mapleader = ","

" <Leader>tab Toggles NERDTree
map <leader><tab> :NERDTreeToggle<cr>

" <Leader>f: Sync the current buffer with NerdTree
map <leader>f :NERDTreeFind<cr>

" <Leader>n: Clear search highlights
map <silent> <leader>n :noh<cr>

" <Leader>v: copy line down
nmap <leader>v yyp

" <Leader>w: Save
map <leader>w :w<cr>
imap <leader>w <esc>:w<cr>a

" <Leader>q: Quit all
map <leader>q :qa<cr>

" <Leader>P: Copy the full path of the current file to the clipboard
map <leader>p :let @+=expand("%:p")<cr>

" <Leader>1: Toggle between paste mode
set pastetoggle=<leader>1

" <Leader>2: Toggle Tagbar
map <leader>2 :TagbarToggle<cr>

" <Leader>cd: Switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" <Leader>e: Fast editing of the .vimrc
map <leader>e :e! ~/.dotfiles/.vimrc<cr>

" <Leader>sd: Search the highlighted word literally using Ack
vnoremap <leader>sd y:<c-u>Ack -Qu '<c-r>"'<cr>
nnoremap <leader>sd :Ack -Qu '<c-r><c-w>'<cr>

" <Leader>sf: Search the highlighted word literally on the current buffer using
" Ack
vnoremap <leader>sf y:<c-u>Ack -Q '<c-r>"' %<cr>
nnoremap <leader>sf :Ack -Q '<c-r><c-w>' %<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Paste to command mode using Ctrl-V
cnoremap <c-v> <c-r>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable arrow keys, they're evil
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Ctrl-C, that's a bad habit, use Ctrl-[ or jk instead
imap <c-c> <nop>

" Map jk to escape in insert mode
imap jk <esc>

" Backspace deletes character in normal mode
map <bs> X

" Alt-[hl]: Move in normal mode
nnoremap <m-h> B
nnoremap <m-l> W

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
nnoremap <c-n><c-n> :set invnumber<cr>

" Ctrl-N Ctrl-T: Open new tab
nnoremap <c-n><c-t> :tabnew<cr>

" Ctrl-N Ctrl-W: Close tab
nnoremap <c-n><c-w> :tabclose<cr>

" Ctrl-Backspace: Delete previous word
inoremap <c-bs> <c-w>

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
inoremap <c-v> <esc>:set paste<cr><esc>"+gp:set nopaste<cr>a
vnoremap <c-c> "+y

" Paste in visual mode should not replace the default register with the deleted
" text
vnoremap p "_dP

" Easier search and replace
vnoremap <c-r> "hy:%s/<c-r>h//gc<left><left><left>

" Highlight visual selections
vmap * y:let @/ = @"<cr>

" Select all with Ctrl-A
nnoremap <c-a> ggvGg_

" Ctrl-S to save
nmap <c-s> :w<cr>
imap <c-s> <c-o><c-s>

" Remap Ctrl-W to quit
noremap <c-w> :q<cr>

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

" same for jumping back and forth
nnoremap <c-o> <c-o>zzzv
nnoremap <c-i> <c-i>zzzv

" basic readline shortcuts
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" make backspace work sanely in visual mode
vnoremap <bs> x

" Map space to / (search) and c-space to ? (backgwards search)
noremap <space> /
noremap <c-space> ?

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Remap VIM 0
map 0 ^

" Move a line of text using Alt+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
imap <M-j> <esc><M-j>a
nmap <M-k> mz:m-2<cr>`z
imap <M-k> <esc><M-k>a
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
smap <M-j> <C-G><M-j>
smap <M-k> <C-G><M-k>
smap <D-j> <M-j>
smap <D-k> <M-k>
imap <D-j> <M-j>
imap <D-k> <M-k>

" FIXME None of the following works in the terminal
" Copy a line using Ctrl-Alt-j
nmap <C-M-j> yyp

" Restart vim with Ctrl-Alt-R
nmap <C-M-r> :RestartVim<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark

" Colorscheme
" colorscheme desert-warm-256
" colorscheme distinguished
" colorscheme solarized
" colorscheme vivdchalk
colorscheme jellybeans

" Sets how many lines of history vim has to remember
set history=10000

" Set to auto read when a file is changed from the outside
set autoread

" Display unprintable chars
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Enables the /g flag on :s substitutions by default
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

" Set completion mode. first tab completes as much as possible, second tab shows
" list of options
set wildmode=longest,list
set wildmenu "turn on wild menu

" Allow changing buffer without saving it first 
set hidden

" Set backspace config
set backspace=eol,start,indent

" Case insensitive search
set ignorecase
set smartcase

" Highlight search result
set hlsearch

" Make search act like search in modern browsers
set incsearch

set magic

" Show matching braces
set showmatch

" Turn off sound
set vb
set t_vb=

" Disable vi-compatibility
set nocompatible

" Always show the statusline
set laststatus=2

" Explicitly set encoding to utf-8
set encoding=utf-8

" Column width indicator
set colorcolumn=+1 

" Lower the delay of escaping out of other modes
set timeout timeoutlen=1000 ttimeoutlen=0

" Fix meta-keys which generate <Esc>a .. <Esc>z
let c='a'
while c <= 'z'
  exec "set <M-".c.">=\e".c
  exec "imap \e".c." <M-".c.">"
  let c = nr2char(1+char2nr(c))
endw

" Reload vimrc when edited, also reload the powerline color
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC
        \ | call Pl#Load() | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Set font according to system
if has("unix")
    set gfn=Ubuntu\ Mono\ for\ Powerline\ 12
elseif has("macunix")
    set gfn=menlo\ for\ powerline:h12
elseif has("win32")
    set gfn=consolas:h12
endif

" 256bit terminal
set t_Co=256

" Disble menu and toolbar
set go-=T
set go-=m

try
    lang en_us
catch
endtry

" Sets default file formats
set fileformats=unix,dos,mac 

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowritebackup
set noswapfile

" Tab settings
set expandtab
set shiftwidth=2
set tabstop=8
set softtabstop=2
set smarttab

" Text display settings
set linebreak
set textwidth=80
set autoindent 
set wrap 
set whichwrap+=h,l,<,>,[,]

set guitablabel=%t

set clipboard-=autoselect

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowBookmarks=1
" only start if no file is specified (this appears to cause powerline to not
" show up correctly inside of tmux for some strange reason. Disable it for now
" autocmd vimenter * if !argc() | NERDTree | wincmd p | endif
" close vim if the only window open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" returns true iff is NERDTree open/active
function! rc:isNTOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" returns true iff focused window is NERDTree window
function! rc:isNTFocused()     
  return -1 != match(expand('%'), 'NERD_Tree') 
endfunction 

" calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! rc:syncTree()
  if &modifiable && rc:isNTOpen() && !rc:isNTFocused() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

autocmd BufEnter * call rc:syncTree()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERD Commenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always leave a space between the comment character and the comment
let NERDSpaceDelims=1

" \: Toggle comment
map \ <leader>c<space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Powerline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use the fancy version of Powerline symbols
let g:Powerline_symbols = 'fancy'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic settings
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': ['ruby', 'php'],
            \ 'passive_filetypes': ['puppet'] }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>gb :Gblame<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gp :Git push<cr>
nmap <leader>gr :Gremove<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>gw :Gwrite<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <c-b> :CtrlPBuffer<cr>

