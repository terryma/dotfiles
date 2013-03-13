" Disable vi-compatibility
set nocompatible

"===============================================================================
" NeoBundle
"===============================================================================
if has ('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', { 'build': {
      \   'windows': 'make -f make_mingw32.mak',
      \   'cygwin': 'make -f make_cygwin.mak',
      \   'mac': 'make -f make_mac.mak',
      \   'unix': 'make -f make_unix.mak',
      \ } }

" Fuzzy search
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/unite-session'
NeoBundle 'mileszs/ack.vim'

" Code completion
NeoBundle 'Shougo/neocomplcache'

" Snippets
NeoBundle 'Shougo/neosnippet'
NeoBundle 'honza/snipmate-snippets'

" Marks
NeoBundle 'kshenoy/vim-signature'

" Comments
NeoBundle 'scrooloose/nerdcommenter'

" File browsing
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/vimfiler'

" Syntax checker
NeoBundle 'scrooloose/syntastic'

" Shell
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/vimshell'

" File types
" NeoBundle 'mattn/zencoding-vim' "HTML
NeoBundle 'tpope/vim-markdown' "Markdown
NeoBundle 'vim-scripts/deb.vim' "Debian packages

" Git
NeoBundle 'tpope/vim-fugitive'

" Motions
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'goldfeld/vim-seek'

" Text Objects
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-entire' " ae, ie
NeoBundle 'kana/vim-textobj-lastpat' " a/, i/, a?, i?
NeoBundle 'kana/vim-textobj-line' " al, il
NeoBundle 'lucapette/vim-textobj-underscore' " a_, i_

" Tags
NeoBundle 'xolox/vim-easytags'
NeoBundle 'majutsushi/tagbar'

" Status line
NeoBundle 'terryma/vim-powerline', {'rev':'develop'}

" Color themems
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'Lokaltog/vim-distinguished'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'tpope/vim-vividchalk'
NeoBundle 'chriskempson/tomorrow-theme', {'rtp': 'vim'}
NeoBundle 'rainux/vim-desert-warm-256'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/wombat256.vim'

" Misc
NeoBundle 'vim-scripts/BufOnly.vim'
NeoBundle 'vim-scripts/TaskList.vim'
NeoBundle 'AndrewRadev/multichange.vim'
NeoBundle 'kana/vim-submode'
NeoBundle 'kana/vim-scratch'
NeoBundle 'myusuf3/numbers.vim'
NeoBundle 'sjl/gundo.vim'
" NeoBundle 'kana/vim-smartinput'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'kana/vim-arpeggio'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
" NeoBundle 'Shougo/echodoc'

" Ones that I don't really use anymore
" NeoBundle 'klen/python-mode'
" NeoBundle 'nathanaelkane/vim-indent-guides'
" NeoBundle 'hynek/vim-python-pep8-indent'
" NeoBundle 'kien/ctrlp.vim'
" NeoBundle 'mattn/calendar-vim'
" NeoBundle 'sjl/clam.vim'
" NeoBundle 'xolox/vim-session'

filetype plugin indent on
syntax enable

NeoBundleCheck

"===============================================================================
" Local settings
"===============================================================================

try
  source ~/.vimrc.local
catch
endtry

"===============================================================================
" General Settings
"===============================================================================

" Set augroup
augroup MyAutoCmd
  autocmd!
augroup END

syntax on

" Turn on the mouse, since it doesn't play well with tmux anyway. This way I can
" scroll in the terminal
set mouse=a

" Give one virtual space at end of line
set virtualedit=onemore

" Use relative numbering to help with motion
set relativenumber

" Always splits to the right and below
set splitright
set splitbelow

" Turn on cursorline only on active window
augroup MyAutoCmd
    autocmd WinLeave * setlocal nocursorline
    autocmd WinEnter,BufRead * setlocal cursorline
augroup END

set background=dark

" Colorschemes
" colorscheme Tomorrow-Night
" colorscheme Tomorrow-Night-Bright
colorscheme jellybeans

" Sets how many lines of history vim has to remember
set history=10000

" Set to auto read when a file is changed from the outside
set autoread

" Set to auto write file
set autowrite

" Display unprintable chars
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=10

" Width of the number column on the left hand side, needs a little extra to show
" the marks
set numberwidth=6

" Open all folds initially
set foldmethod=indent
set foldlevelstart=99

" Show mode
set showmode

" Auto complete setting
set completeopt=longest,menuone,preview

set wildmode=list:longest,full
set wildmenu "turn on wild menu
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app

" Allow changing buffer without saving it first 
set hidden

" Set backspace config
set backspace=eol,start,indent

" Case insensitive search
set ignorecase
set smartcase

" Make search act like search in modern browsers
set incsearch

" Make regex a little easier to type
set magic

" Show matching braces
set showmatch

" Turn off sound
set vb
set t_vb=

" Always show the statusline
set laststatus=2

" Explicitly set encoding to utf-8
set encoding=utf-8

" Column width indicator
set colorcolumn=+1 

" Lower the delay of escaping out of other modes
set timeout timeoutlen=1000 ttimeoutlen=0

" Fix meta-keys which generate <Esc>a .. <Esc>z
if !has('gui_running')
  let c='a'
  while c <= 'z'
    exec "set <M-".c.">=\e".c
    exec "imap \e".c." <M-".c.">"
    let c = nr2char(1+char2nr(c))
  endw
endif

" Reload vimrc when edited, also reload the powerline color
autocmd MyAutoCmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc
      \ so $MYVIMRC | call Pl#Load() | if has('gui_running') | so $MYGVIMRC | endif

" 256bit terminal
set t_Co=256

" Disable menu and toolbar
set go-=T
set go-=m

try
  lang en_us
catch
endtry

" Turn backup off
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
set nowrap
set whichwrap+=h,l,<,>,[,]

set guitablabel=%t

set clipboard-=autoselect

" Spelling highlights. Use underline in term to prevent cursorline highlights
" from interfering
if !has("gui_running")
  hi clear SpellBad
  hi SpellBad cterm=underline ctermfg=red
  hi clear SpellCap
  hi SpellCap cterm=underline ctermfg=blue
  hi clear SpellLocal
  hi SpellLocal cterm=underline ctermfg=blue
  hi clear SpellRare
  hi SpellRare cterm=underline ctermfg=blue
endif

" Use a low updatetime. This is used by CursorHold
set updatetime=1000

"===============================================================================
" Function key mappings
"===============================================================================

" <F1>: Help
nmap <F1> [unite]h

" <F2>: Open Vimfiler

" <F3>: Gundo
nnoremap <F3> :<C-u>GundoToggle<CR>

" <F4>: Save session
nnoremap <F4> :<C-u>UniteSessionSave 

"===============================================================================
" Leader key mappings
"===============================================================================

" Map leader and localleader key to comma
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

" <Leader>``: Force quit all
nnoremap <Leader>`` :qa!<cr>

" <Leader>1: Toggle between paste mode
nnoremap <silent> <Leader>1 :set paste!<cr>

" <Leader>2: Toggle Tagbar
nnoremap <Leader>2 :TagbarToggle<cr>

" <Leader>3: Open Tasklist
nnoremap <Leader>3 <Plug>TaskList

" <Leader>0: Run the visually selected code in python and replace it with the
" output
vnoremap <silent> <Leader>0 :!python<cr>

" <Leader>tab: Toggles NERDTree
nnoremap <Leader><tab> :NERDTreeToggle<cr>
" nnoremap <expr><Leader><tab> g:my_open_explorer_command()

" <Leader>q: Quit all, very useful in vimdiff
nnoremap <Leader>q :qa<cr>

" <Leader>w: Save all
nnoremap <Leader>w :wa<cr>

" <Leader>e: Fast editing of the .vimrc
nnoremap <Leader>e :e! ~/.dotfiles/.vimrc<cr>

" <Leader>r: QuickRun's default keymap

" <Leader>t: EasyMotion

" TODO <Leader> y

" TODO <Leader> u

" <Leader>o: only
nnoremap <Leader>o :only<cr>

" TODO <Leader> p

" <Leader>s: Spell checking shortcuts
nnoremap <Leader>ss :setlocal spell!<cr>
nnoremap <Leader>sj ]s
nnoremap <Leader>sk [s
nnoremap <Leader>sa zg]s
nnoremap <Leader>sd 1z=
nnoremap <Leader>sf z=

" <Leader>d: copy line down (d for duplicate)
nnoremap <Leader>d mzyyp`zj

" <Leader>f: EasyMotion

" <Leader>g: Fugitive shortcuts

" <Leader>z: unused

" <Leader>x: unused

" <Leader>c*: NERDCommenter mappings
" <Leader>cd: Switch to the directory of the open buffer
nnoremap <Leader>cd :cd %:p:h<cr>:pwd<cr>

" <Leader>v: unused

" <Leader>b: unused

" <Leader>n: NERDTreeFind
nnoremap <silent> <Leader>n :NERDTreeFind<cr> :wincmd p<cr>

" <Leader>p: Copy the full path of the current file to the clipboard
nnoremap <silent> <Leader>p :let @+=expand("%:p")<cr>:echo "Copied current file
      \ path '".expand("%:p")."' to clipboard"<cr>

" <Leader><space>: unused

" <Leader>F: EasyMotion

" <Leader>T: EasyMotion

"===============================================================================
" Command-line Mode Key Mappings
"===============================================================================

" Bash like keys for the command line
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-j> <down>
cnoremap <c-k> <up>

" Ctrl-[hl]: Move left/right by character
cnoremap <c-h> <left>
cnoremap <c-l> <right>

" Alt-[hl]: Moves left/right by word, since Shift-left/right are used by tmux
" to switch panes
cnoremap <m-h> <s-left>
cnoremap <m-l> <s-right>

" Paste to command mode using Ctrl-V
cnoremap <c-v> <c-r>"

" w!: Change ro files to rw
" function! s:chmodonwrite()
  " if v:cmdbang
    " silent !chmod u+w %
  " endif
" endfunction
" autocmd MyAutoCmd bufwrite * call s:chmodonwrite()

" w!!: Writes using sudo
cnoremap w!! w !sudo tee % >/dev/null

"===============================================================================
" Normal Mode Shift Key Mappings
"===============================================================================

" Q: Closes the window
nnoremap Q :q<cr>

" W: Move word forward

" E: Move to end of word forward

" R: Replace mode

" T: Finds till backwards

" Y: Remove join lines to this, Y looks like a join of two lines into one
noremap Y J

" U: Redos since 'u' undos
nnoremap U <c-r>

" I: Insert at beginning of line

" O: Insert line above

" P: Paste above line

" {: Beginning of paragraph

" }: End of paragraph

" _ : Quick horizontal splits
nnoremap _ :sp<cr>

" | : Quick vertical splits
nnoremap <bar> :vsp<cr>

" A: Insert at end of line

" S: Deletes the line and puts us in insert mode

" D: Deletes til the end of line

" F: Finds backwards

" G: Go to end of file

" H: Go to beginning of line
noremap H ^

" J: Scroll down, Ctrl-e is a little difficult to reach
noremap J 3<c-e>3j

" K: Scroll up, Ctrl-y is a difficult to reach
noremap K 3<c-y>3k

" L: Go to end of line
noremap L $

" :: Go to command-line mode. Since ; is also used to go to command-line mode,
" : should be mapped to what ; used to do (next when doing fFtT). But since
" we're using EasyMotion to replace what fFtT used to do, it renders ; obsolete

" ": Handles registers

" Z: Jump to match. Easier to reach than %
noremap Z %

" X: Deletes character backward

" C: Deletes rest of line and go to insert mode

" V: Visual line mode

" B: Move word backward

" N: Find next occurrence backward
nnoremap N Nzzzv

" M: Move cursor to mid screen

" <: Indent left

" >: Indent right

" ?: Search backwards

" +/-: Increment number
nnoremap + <c-a>
nnoremap - <c-x>

"===============================================================================
" Normal Mode Ctrl Key Mappings
"===============================================================================

" Ctrl-q: Visual block mode

" Ctrl-w: Window management

" Ctrl-e: Unite outline
nmap <c-e> [unite]o

" Ctrl-r: Easier search and replace. Redo is remapped to U
nnoremap <c-r> :%s/<c-r><c-w>//gc<left><left><left>

" Ctrl-y: Unite line
nmap <c-y> [unite]l

" Ctrl-t: Go back in tag stack

" Ctrl-t*: Tab operations
nnoremap <c-t><c-n> :tabnew<cr>
nnoremap <c-t><c-w> :tabclose<cr>
nnoremap <c-t><c-j> :tabprev<cr>
nnoremap <c-t><c-h> :tabprev<cr>
nnoremap <c-t><c-k> :tabnext<cr>
nnoremap <c-t><c-l> :tabnext<cr>
let g:lasttab = 1
nnoremap <c-t><c-t> :exe "tabn ".g:lasttab<cr>
autocmd MyAutoCmd TabLeave * let g:lasttab = tabpagenr()

" Ctrl-u: Scroll half a screen up

" Ctrl-i: Go forward in the jumplist, also realign the screen
nnoremap <c-i> <c-i>zzzv

" Ctrl-o: Go back in the jumplist, also realign the screen
nnoremap <c-o> <c-o>zzzv

" Ctrl-p: Go to previous buffer
nnoremap <c-p> <c-^>

" Ctrl-[: Esc

" Ctrl-]: Go forward in tag stack

" Ctrl-\: Quick VimShell
nnoremap <silent> <c-\> :<C-u>VimShellBufferDir -popup -toggle<CR>

" Ctrl-a: Surround shortcut
nmap <c-a> viwS

" Ctrl-ss: Find word under cursor in current directory
nnoremap <c-s><c-s> :Unite grep:.::<C-r><C-w><CR>
" Ctrl-sd: Find word in current directory (prompt for word)
nnoremap <c-s><c-d> :Unite grep:.<CR>

" Ctrl-d: Scroll half a screen down

" Ctrl-f: Scroll one full screen down
nnoremap <c-f> zz<c-f>zz

" Ctrl-g: Prints current file name
nnoremap <c-g> 1<c-g>

" Ctrl-[hjkl]: Move around splits
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l

" Ctrl-;: Vim can't map this

" Ctrl-': Vim can't map this

" Ctrl-z: This is the command key for tmux

" Ctrl-x: Rope

" Ctrl-c: Rope

" Ctrl-v: Paste system clipboard
nnoremap <c-v> :set paste<cr>"+gP:set nopaste<cr>
if has("unix")
  " This works much more reliably when trying to paste from Vim remotely
  " TODO Maybe only do this through a remote connection?
  nnoremap <silent> <c-v> :r!xsel -b<CR>
endif

" Ctrl-b: Scroll one full screen back
" Strange, backward one screen seems to be off by one
nnoremap <c-b> zz<c-b>kzz

" Ctrl-n: Multichange default mapping

" Ctrl-m: Same as Enter

" Ctrl-,: Vim can't map this

" Ctrl-.: Vim can't map this

" Ctrl-/: Vim can't map this

" Ctrl-Space: [unite]<space> is very often used, map to that
nmap <c-space> [unite]<space>
nmap <c-@> <c-space>

"===============================================================================
" Insert Mode Ctrl Key Mappings
"===============================================================================

" Ctrl-w: Delete previous word

" Ctrl-e: Go to end of line
inoremap <c-e> <esc>A

" Ctrl-r: Insert register

" Ctrl-t: Indent shiftwidth

" Ctrl-y: Insert char above cursor

" Ctrl-u: Delete til beginning of line

" Ctrl-i: Tab

" Ctrl-o: Execute one normal mode command

" Ctrl-p: Auto complete previous

" Ctrl-a: Go to begin of line
inoremap <c-a> <esc>I

" Ctrl-s: Used by vim-surround

" Ctrl-d: Unindent shiftwidth

" TODO Ctrl-f: 

" Ctrl-g: 

" Ctrl-[hjkl]: Move cursor
inoremap <c-h> <left>
inoremap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<down>"
inoremap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<up>"
inoremap <c-l> <right>

" Ctrl-z: This is the command key for tmux

" Ctrl-x: Delete char under cursor. (If we simply use x, it wouldn't delete
" newline chars
inoremap <c-x> <right><c-o>X

" Ctrl-c: Inserts line below
inoremap <c-c> <c-o>o

" TODO Ctrl-v:
" TODO Ctrl-b:

" Ctrl-n: Auto complete next

" Ctrl-m: Same as Enter

" TODO Ctrl-space:

"===============================================================================
" Visual Mode Ctrl Key Mappings
"===============================================================================

" Ctrl-c: Copy to the system clipboard
vnoremap <c-c> "+y
if has("unix")
  " This works much more reliably when trying to copy from Vim remotely
  " TODO Maybe only do this through a remote connection?
  vnoremap <silent> <c-c> :w !xsel -i -b<CR><CR>
endif

" Ctrl-r: Easier search and replace
vnoremap <c-r> "hy:%s/<c-r>h//gc<left><left><left>

" Ctrl-s: Easier substitue
vnoremap <c-s> :s/\%V//g<left><left><left>

"===============================================================================
" Meta key mappings
"===============================================================================

" Normal Mode

" Alt-[jk]: Move current line up or down
nnoremap <silent> <m-j> mz:m+<cr>`z
nnoremap <silent> <m-k> mz:m-2<cr>`z

" Alt-o: Jump back in the changelist
nnoremap <m-o> g;

" Alt-i: Jump forward in the changelist
nnoremap <m-i> g,

" Insert Mode
" Alt-[jk]: Move current line up or down
imap <m-j> <esc><m-j>a
imap <m-k> <esc><m-k>a

" Visual Mode
" Alt-[jk]: Move selections up or down
vnoremap <m-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <m-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Alt-[hl]: Move word in insert mode
inoremap <m-h> <esc>gEa
inoremap <m-l> <esc>Ea

"===============================================================================
" Space key mappings
"===============================================================================

" Space is also the leader key for Unite actions
" Space-[jk] scrolls the page
call submode#enter_with('scroll', 'n', '', '<space>j', '3<c-e>')
call submode#enter_with('scroll', 'n', '', '<space>k', '3<c-y>')
call submode#map('scroll', 'n', '', 'j', '3<c-e>')
call submode#map('scroll', 'n', '', 'k', '3<c-y>')

" Space-=: Resize windows
nnoremap <space>= <c-w>=

" Space-m: quickhl
" nmap <space>m <Plug>(quickhl-toggle)
" xmap <space>m <Plug>(quickhl-toggle)
" nmap <space>M <Plug>(quickhl-reset)
" xmap <space>M <Plug>(quickhl-reset)

" Space-t: ScratchBuffer (temp)
nmap <space>t <Plug>(scratch-open)

"===============================================================================
" Arpeggio Mappings
"===============================================================================

" call arpeggio#load()
" Arpeggioimap fj <Esc>

"===============================================================================
" Normal Mode Key Mappings
"===============================================================================

" q: Record macros
" w: Move word forward
" e: Move to end of word
" r: Replace single character
" t: Find till
" y: Yank
" u: Undo
" i: Insert before cursor
" o: Insert line below cursor
" p: Paste
" [: Many functions
" ]: Many functions
" \: Toggle comment
nmap \ <Leader>c<space>
" a: Insert after cursor
" s: Substitute
" d: Delete
" f: Find 
" g: Many functions
" gp to visually select pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
" h: Left
" j: Down
" k: Up
" l: Right
" ;: Command mode
noremap ; :
" ::: Remap to ';', repeat last fFtT
nnoremap :: ;
" :": Remap to ',', repeat last fFtT in opposite direction
nnoremap :" ,
" ': Go to mark
" z: Many functions
" x: Delete char
" c: Change
" v: Visual mode
" b: Move word backward
" n: Next, keep search matches in the middle of the window
nnoremap n nzzzv
" m: Marks
" ,: Leader
" .: Repeat last command
" /" Search
" Up Down Left Right resize splits
nnoremap <up> <c-w>+
nnoremap <down> <c-w>-
nnoremap <left> <c-w><
nnoremap <right> <c-w>>

" Enter: Toggle search highlight
nnoremap <cr> :set hlsearch! hlsearch?<cr>

" Backspace: Toggle number
nnoremap <bs> :<C-u>NumbersToggle<CR>

"===============================================================================
" Visual Mode Key Mappings
"===============================================================================

" p: Paste in visual mode should not replace the default register with the
" deleted text
vnoremap p "_dP

" \: Toggle comment
vmap \ <Leader>c<space>

" <cr>: Highlight visual selections
vnoremap <silent> <CR> y:let @/ = @"<cr>:set hlsearch<cr>

" <bs>: Delete selected
" This conflicts with neosnippets. Don't enable it
" vnoremap <bs> x

" <|>: Reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" .: repeats the last command on every line
vnoremap . :normal.<cr>

" @: repeats macro on every line
vnoremap @ :normal@

"===============================================================================
" Autocommands
"===============================================================================

" q quits in certain page types
autocmd MyAutoCmd FileType help,quickrun,qf
      \ map <silent> <buffer> q :q<cr>|
      \ map <silent> <buffer> <esc> :q<cr>

" json = javascript syntax highlight
autocmd MyAutoCmd FileType json setlocal syntax=javascript

"===============================================================================
" NERDTree
"===============================================================================

let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
" Close vim if the only window open is nerdtree
autocmd MyAutoCmd BufEnter * 
      \ if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"===============================================================================
" NERDCommenter
"===============================================================================

" Always leave a space between the comment character and the comment
let NERDSpaceDelims=1

"===============================================================================
" Powerline
"===============================================================================

" Use the fancy version of Powerline symbols
let g:Powerline_symbols = 'fancy'

"===============================================================================
" Syntastic
"===============================================================================

" TODO(terryma): Update these settings
" Syntastic settings
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': ['ruby', 'php'],
            \ 'passive_filetypes': ['puppet'] }

"===============================================================================
" Fugitive
"===============================================================================

nnoremap <Leader>gb :Gblame<cr>
nnoremap <Leader>gc :Gcommit<cr>
nnoremap <Leader>gd :Gdiff<cr>
nnoremap <Leader>gp :Git push<cr>
nnoremap <Leader>gr :Gremove<cr>
nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gw :Gwrite<cr>
" Quickly stage, commit, and push the current file. Useful for editing .vimrc
nnoremap <Leader>gg :Gwrite<cr>:Gcommit -m 'update'<cr>:Git push<cr>

"===============================================================================
" EasyMotion
"===============================================================================

" Tweak the colors
hi link EasyMotionTarget WarningMsg
hi link EasyMotionShade  Comment

" Replace the normal fFtF keys with EasyMotion
let g:EasyMotion_mapping_f = '<Leader>f'
let g:EasyMotion_mapping_F = '<Leader>F'
let g:EasyMotion_mapping_t = '<Leader>t'
let g:EasyMotion_mapping_T = '<Leader>T'

"===============================================================================
" Neocomplcache and Neosnippets
"===============================================================================

" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 1
" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1
let g:snips_author = "Terry Ma"

" Tab always completes the suggestion
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? neocomplcache#close_popup() : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" Enter always performs a literal enter
imap <expr><cr> neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
augroup MyAutoCmd
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
augroup END

if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Tell Neosnippets to use the snipmate snippets
let g:neosnippet#snippets_directory='~/.dotfiles/.vim/bundle/snipmate-snippets,~/.dotfiles/.vim/snippets'

"===============================================================================
" Unite
"===============================================================================

" Use the fuzzy matcher for everything
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" Use the rank sorter for everything
call unite#filters#sorter_default#use(['sorter_rank'])

" Set up some custom ignores
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'git5/.*/review/',
      \ 'google/obj/',
      \ ], '\|'))

" Map space to the prefix for Unite
nnoremap [unite] <Nop>
nmap <space> [unite]

" General fuzzy search
nnoremap <silent> [unite]<space> :<C-u>Unite
      \ -buffer-name=files buffer file_mru bookmark file_rec/async<CR>

" Quick file search
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file_rec/async file/new<CR>

" Quick MRU search
nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mru file_mru<CR>

" Quick commands
nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=commands command<CR>

" Quick bookmarks
nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=bookmarks bookmark<CR>
" Fuzzy search from current buffer
" nnoremap <silent> [unite]b :<C-u>UniteWithBufferDir
      " \ -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>

" Quick registers
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>

" Quick outline
nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline -vertical -winwidth=45 outline<CR>

" Quickly switch lcd
nnoremap <silent> [unite]d
      \ :<C-u>Unite -buffer-name=change-cwd -default-action=lcd directory_mru<CR>

" Quick mappings
" nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mappings mapping<CR>

" Quick sources
nnoremap <silent> [unite]a :<C-u>Unite -buffer-name=sources source<CR>

" Quick grep from cwd
nnoremap <silent> [unite]g :<C-u>Unite -buffer-name=grep grep:.<CR>

" Quick help
nnoremap <silent> [unite]h :<C-u>Unite -buffer-name=help help<CR>

" Quick line using the word under cursor
nnoremap <silent> [unite]l :<C-u>UniteWithCursorWord -buffer-name=search line<CR>

" Quick snippet
nnoremap <silent> [unite]s :<C-u>Unite -buffer-name=snippets snippet<CR>

" Quick sessions (projects)
nnoremap <silent> [unite]p :<C-u>Unite -buffer-name=sessions session<CR>

" Custom Unite settings
autocmd MyAutoCmd FileType unite call s:unite_settings()
function! s:unite_settings()"{{{

  " TODO Customize these mappings
  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> jj <Plug>(unite_insert_leave)

  imap <buffer><expr> j unite#smart_map('j', '')
  imap <buffer> <TAB> <Plug>(unite_select_next_line)
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  imap <buffer> '     <Plug>(unite_quick_match_default_action)
  nmap <buffer> '     <Plug>(unite_quick_match_default_action)
  imap <buffer><expr> x
        \ unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
  nmap <buffer> x     <Plug>(unite_quick_match_choose_action)
  nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
  nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
  nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)
  " nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
  " imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
  nmap <buffer> <C-r> <Plug>(unite_redraw)
  imap <buffer> <C-r> <Plug>(unite_redraw)
  nmap <silent><buffer><expr> <c-s> unite#do_action('split')
  nmap <silent><buffer><expr> <c-v> unite#do_action('vsplit')
  nnoremap <silent><buffer><expr> l
        \ unite#smart_map('l', unite#do_action('default'))

  let unite = unite#get_current_unite()
  if unite.buffer_name =~# '^search'
    nnoremap <silent><buffer><expr> r     unite#do_action('replace')
  else
    nnoremap <silent><buffer><expr> r     unite#do_action('rename')
  endif

  nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
  nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
        \ empty(unite#mappings#get_current_filters()) ? ['sorter_reverse'] : [])
endfunction"}}}

" Start in insert mode
let g:unite_enable_start_insert = 1

" Enable short source name in window
" let g:unite_enable_short_source_names = 1

" Open in bottom right
let g:unite_split_rule = "botright"

" Shorten the default update date of 500ms
let g:unite_update_time = 200

let g:unite_source_file_mru_limit = 1000
let g:unite_cursor_line_highlight = 'TabLineSel'
" let g:unite_abbr_highlight = 'TabLine'

let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_file_mru_time_format = ''

" For ack.
if executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
  " Match whole word only. This might/might not be a good idea
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a -w'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a -w'
  let g:unite_source_grep_recursive_opt = ''
endif

"===============================================================================
" Unite Sessions
"===============================================================================

" Save session automatically.
let g:unite_source_session_enable_auto_save = 1

" Pop up session selection if no file is specified
autocmd MyAutoCmd VimEnter * call s:unite_session_on_enter()
function! s:unite_session_on_enter()
  if !argc()
    Unite -buffer-name=sessions session
  endif
endfunction

"===============================================================================
" Vimfiler
"===============================================================================

" TODO Look into Vimfiler more
" Example at: https://github.com/hrsh7th/dotfiles/blob/master/vim/.vimrc
nnoremap <expr><F2> g:my_open_explorer_command()
function! g:my_open_explorer_command()
  return printf(":\<C-u>VimFilerBufferDir -buffer-name=%s -split -auto-cd -toggle -no-quit -winwidth=%s\<CR>",
        \ g:my_vimfiler_explorer_name,
        \ g:my_vimfiler_winwidth)
endfunction

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
" let g:vimfiler_file_icon = ' '
let g:vimfiler_marked_file_icon = '✓'
" let g:vimfiler_readonly_file_icon = ' '
let g:my_vimfiler_explorer_name = 'explorer'
let g:my_vimfiler_winwidth = 30
let g:vimfiler_safe_mode_by_default = 0
" let g:vimfiler_directory_display_top = 1

autocmd MyAutoCmd FileType vimfiler call s:vimfiler_settings()
function! s:vimfiler_settings()
  nmap     <buffer><expr><CR>  vimfiler#smart_cursor_map("\<PLUG>(vimfiler_expand_tree)", "e")
endfunction

"===============================================================================
" VimShell
"===============================================================================

let g:vimshell_prompt = "% "
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
autocmd MyAutoCmd FileType vimshell call s:vimshell_settings()
function! s:vimshell_settings()
  call vimshell#altercmd#define('g', 'git')
endfunction

"===============================================================================
" QuickRun
"===============================================================================

let g:quickrun_config = {}
let g:quickrun_config['*'] = {
      \ 'runner/vimproc/updatetime' : 100,
      \ 'outputter' : 'buffer',
      \ 'runner' : 'vimproc',
      \ 'running_mark' : 'ﾊﾞﾝ（∩`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾞﾝ',
      \ 'into' : 1,
      \ 'runmode' : 'async:remote:vimproc'
      \}

"===============================================================================
" Zencoding
"===============================================================================

" let g:user_zen_leader_key = '<space>x'

"===============================================================================
" ScratchBuffer
"===============================================================================

autocmd MyAutoCmd User PluginScratchInitializeAfter
\ call s:on_User_plugin_scratch_initialize_after()

function! s:on_User_plugin_scratch_initialize_after()
  map <buffer> <CR>  <Plug>(scratch-evaluate!)
endfunction
let g:scratch_show_command = 'hide buffer'

"===============================================================================
" Quickhl
"===============================================================================

" let g:quickhl_colors = [
      " \ "gui=bold ctermfg=255 ctermbg=153 guifg=#ffffff guibg=#0a7383",
      " \ "gui=bold guibg=#a07040 guifg=#ffffff",
      " \ "gui=bold guibg=#4070a0 guifg=#ffffff",
      " \ ]

"===============================================================================
" My functions
"===============================================================================

" function! Refactor()
  " call inputsave()
  " let @z=input("What do you want to rename '" . @z . "' to? ")
  " call inputrestore()
" endfunction
" " Locally (local to block) rename a variable
" nnoremap <Leader>rf "zyiw:call Refactor()<cr>mx:silent! norm gd<cr>[{V%:s/<C-R>//<c-r>z/g<cr>`x

command! -nargs=+ Silent
      \ | execute ':silent !'.<q-args>
      \ | execute ':redraw!'

" Format json using python. This needs some better error checking
command! -nargs=0 -range=% Format 
      \ <line1>,<line2>!python -c "import sys, json, collections; print json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), sort_keys=False, indent=2)"
