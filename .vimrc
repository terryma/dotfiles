set nocompatible

"===============================================================================
" vim-plug
"===============================================================================
call plug#begin('~/.vim/plugged')
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Code completion
" Plug 'Valloric/YouCompleteMe', { 'on': [] }

" Snippets
" Plug 'SirVer/ultisnips', { 'on': [] }
" Plug 'honza/vim-snippets'

" Marks
" Plug 'airblade/vim-gitgutter'

" Comments
Plug 'scrooloose/nerdcommenter'

" Navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ton/vim-bufsurf'

" Syntax checker
Plug 'Chiel92/vim-autoformat'
Plug 'sbdchd/neoformat'
Plug 'hynek/vim-python-pep8-indent'
Plug 'fisadev/vim-isort'
Plug 'w0rp/ale'

" Shell
Plug 'thinca/vim-quickrun'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

" Motions
Plug 'rhysd/clever-f.vim'
" Plug 'easymotion/vim-easymotion'
" Plug 'justinmk/vim-sneak'

" Text Objects
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-user'
" Plug 'kana/vim-textobj-entire' " ae, ie
Plug 'kana/vim-textobj-line' " al, il
Plug 'terryma/vim-expand-region'

" Tags
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'

" Color themems
Plug 'junegunn/seoul256.vim'

" Misc
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'mtth/scratch.vim'
" Plug 'mhinz/vim-startify'
Plug 'terryma/vim-smooth-scroll'
Plug 'terryma/vim-multiple-cursors'
Plug 'hashivim/vim-terraform'
" Plug 'jiangmiao/auto-pairs'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'metakirby5/codi.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/goyo.vim'

call plug#end()

filetype plugin indent on
syntax enable
runtime macros/matchit.vim

"===============================================================================
" Local Settings
" ===============================================================================

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

set lazyredraw
set ttyfast

" Solid line for vsplit separator
set fcs=vert:│

" Don't show the intro
set shortmess+=I

" Turn on the mouse in all modes
set mouse=a

" Give one virtual space at end of line
set virtualedit=onemore

" Turn on line number
set number

" Always splits to the right and below
set splitright
set splitbelow

" Boost performance of rendering long lines
set synmaxcol=300

" Colorscheme
" 256bit terminal
set t_Co=256
let g:seoul256_background = 234
colorscheme seoul256

" Sets how many lines of history vim has to remember
set history=1000

" Set to auto read when a file is changed from the outside
set autoread

" Set to auto write file
set autowriteall

" Display unprintable chars
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣
set showbreak=↪

" listchar=trail is not as flexible, use the below to highlight trailing
" whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=10

" How many lines to scroll at a time, make scrolling appears faster
set scrolljump=5

" Min width of the number column to the left
set numberwidth=1

" Open all folds initially
set foldmethod=indent
set foldlevelstart=99

" No need to show mode
set noshowmode

" Auto complete setting
set completeopt=longest,menuone

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

" Set sensible heights for splits
" set winheight=50

" Make search act like search in modern browsers
set incsearch

" Make regex a little easier to type
set magic

" Don't show matching brackets
set noshowmatch

" Show incomplete commands
set showcmd

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
" keycode times out fast, mapping times out in a bit more time
set timeout timeoutlen=1000 ttimeout ttimeoutlen=1

" Reload vimrc when edited
" autocmd MyAutoCmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc
"       \ so $MYVIMRC | if has('gui_running') | source $MYGVIMRC | endif | AirlineRefresh
autocmd MyAutoCmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc
      \ so $MYVIMRC | if has('gui_running') | source $MYGVIMRC | endif
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
set textwidth=120
set autoindent
set nowrap
set whichwrap+=h,l,<,>,[,]

" Writes to the unnamed register also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
if has ('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" Use a low updatetime. This is used by CursorHold
set updatetime=1000
" I like my word boundary to be a little bigger than the default
" FIXME Apparently this affects html indenting. Figure out what the problem is
" set iskeyword+=<,>,[,],:,-,`,!
" set iskeyword-=_

" Cursor settings. This makes terminal vim sooo much nicer!
" Tmux will only forward escape sequences to the terminal if surrounded by a DCS
" sequence
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Diff options
set diffopt=filler,vertical

" Disable viminfo, causes startup and shutdown to take longer
set viminfo='10,<0,s0,h,/100,:100,@0

"===============================================================================
" Leader Key Mappings
"===============================================================================

" Map leader and localleader key to comma
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

" <Leader>1: Toggle between paste mode
nnoremap <silent> <Leader>1 :set paste!<cr>

" <Leader>2: TODO

" <Leader>tab: TODO

" <Leader>q: Quit all, very useful in vimdiff
nnoremap <Leader>q :qa<cr>

" <Leader>w: TODO

" <Leader>e: Fast editing of the .vimrc
nnoremap <Leader>e :e! ~/.vimrc<cr>

" <Leader>r: TODO

" <Leader>t: TODO

" <Leader>y: TODO

" <Leader>u: TODO

" <Leader>o: TODO

" <Leader>p: TODO

" <Leader>a: TODO
nnoremap <Leader>a :lopen<CR>

" <Leader>s: TODO

" <Leader>d: TODO

" <Leader>f: Autoformat
nnoremap <silent> <Leader>f :Autoformat<CR>

" <Leader>g: Fugitive shortcuts

" <Leader>z: TODO

" <Leader>x: TODO

" <Leader>c*: NERDCommenter mappings
" <Leader>cd: Switch to the directory of the open buffer
nnoremap <Leader>cd :cd %:p:h<cr>:pwd<cr>

" <Leader>v: TODO

" <Leader>b: TODO

" <Leader>n: NERDTreeFind
nnoremap <silent> <Leader>n :NERDTreeFind<cr> :wincmd p<cr>

" <Leader>m: Maximize current split
nnoremap <Leader>m <C-w>_<C-w><Bar>

" <Leader><space>: TODO

" <Leader>,: Switch to previous split
nnoremap <Leader>, <C-w>p

"===============================================================================
" Command-line Mode Key Mappings
"===============================================================================

" Bash like keys for the command line. These resemble personal zsh mappings
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Ctrl-[hl]: Move left/right by word
cnoremap <c-h> <s-left>
cnoremap <c-l> <s-right>

cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-f> <left>
cnoremap <c-g> <right>

" Ctrl-v: Paste
cnoremap <c-v> <c-r>"

" w!!: Writes using sudo
cnoremap w!! w !sudo tee % >/dev/null

autocmd MyAutoCmd CmdwinEnter : map <buffer> <cr> <cr>

"===============================================================================
" Normal Mode Key Mappings
"===============================================================================
" q: record macros
" w: Move word forward
" e: Move to end of word
" r: Replace single character
" t: Find till
" y: Yank. Last yank is always stored in register 0. So paste with "0p if you did a delete after the yank
" u: Undo
" i: Insert before cursor
" o: Insert line below cursor
" p: Paste
nnoremap p gp
" [: Many functions
" ]: Many functions
" \: Toggle comment
nmap \ <Leader>c<space>
" a: Insert after cursor
" s: EasyMotion
" d: Delete. Access it from register "" or "1-9
" f: Clever-f
" g: Many functions
" gp to visually select pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
" h: Left
" j: Down
" k: Up
" l: Right
" ;: Command mode
noremap ; :
" ': Go to mark
" z: Many functions
" x: Delete char
" c: Change into the blackhole register to not clobber the last yank
nnoremap c "_c
" v: Visual mode
" b: Move word backward
" n: Next, keep search matches in the middle of the window
nnoremap n nzzzv
" m: Marks
" ,: Leader
" .: Repeat last command
" /" Search
" Up Down Left Right move pane
nnoremap <up> <c-w>k
nnoremap <down> <c-w>j
nnoremap <left> <c-w>h
nnoremap <right> <c-w>l

" Enter: Highlight cursor location
" nnoremap <silent> <cr> :call CursorPing()<CR>

" Backspace: Toggle search highlight
nnoremap <bs> :set hlsearch! hlsearch?<cr>

" Tab: Same as <Ctrl-i> on the command line

" Space: Scratch
nnoremap <space> :Scratch<CR>

"===============================================================================
" Normal Mode Shift Key Mappings
"===============================================================================

" Shift-Tab: NERDTree
nnoremap <silent> <S-Tab> :NERDTreeToggle<CR>

" Shift-q: Closes the window
nnoremap Q :q!<cr>

" Shift-w: Move to start of next word

" Shift-e: Move to end of word forward

" Shift-r: Reindent entire file
nnoremap R mqHmwgg=G`wzt`q

" Shift-t: Finds till backwards

" Shift-y: Remove join lines to this, Y looks like a join of two lines into one
noremap Y J

" Shift-u: Redos since 'u' undos
nnoremap U :redo<cr>

" Shift-i: Insert at beginning of line

" Shift-o: Insert line above

" Shift-p: Paste above line

" Shift-[: Beginning of paragraph

" Shift-]: End of paragraph

" Shift--(_): Quick horizontal splits
nnoremap _ :sp<cr>

" Shift-\(|): Quick vertical splits
nnoremap <bar> :vsp<cr>

" Shift-a: Insert at end of line

" Shift-s: Split and return to normal mode
nnoremap S i<cr><esc>

" Shift-d: Deletes til the end of line

" Shift-f: Finds backwards

" Shift-g: Go to end of file

" Shift-h: Go to beginning of line.
noremap H ^

" Shift-j: expand-region
map K <Plug>(expand_region_expand)

" Shift-k: shrink-region
map J <Plug>(expand_region_shrink)

" Shift-l: Go to end of line
noremap L g_

" :: TODO

" Shift-'("): Handles registers

" Shift-z: Bufsurf back
nnoremap <silent> Z :BufSurfBack<CR>

" Shift-z: Bufsurf forward
nnoremap <silent> X :BufSurfForward<CR>

" Shift-c: Deletes rest of line and go to insert mode

" Shift-v: Visual line mode

" Shift-b: Move word backward (TODO Replaced by <C-H>, maybe remap?)

" Shift-n: Find next occurrence backward
nnoremap N Nzzzv

" Shift-m: Move cursor to mid screen (TODO Remap since I don't ever use this)
nmap <silent> M <Plug>(ale_next_wrap)

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

" Ctrl-e: TODO

" Ctrl-r: Show command history
nmap <c-r> :History:<CR>

" Ctrl-t: Go to opposite tag
nmap <c-t> %

" Ctrl-y: (Scroll up. Ctrl-k is much more effective TODO Remap)
" Ctrl-u: Scroll half a screen up smoothly
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 5, 1)<CR>

" Ctrl-i: Go forward in the jumplist, also realigns screen. See mapping for
nnoremap <c-i> <c-i>zzzv

" Ctrl-o: Go back in the jumplist, also realign the screen
nnoremap <c-o> <c-o>zzzv

" Ctrl-p: Recent files
nnoremap <c-p> :History<CR>

" Ctrl-[: Esc

" Ctrl-]: Go forward in tag stack

" Ctrl-\: Quick outline
nmap <silent> <c-\> :BTags<CR>

" Ctrl-a: All buffers
nnoremap <c-a> :Buffers<CR>

" Ctrl-s: Save
nmap <c-s> :w!<CR>

" Ctrl-d: Scroll half a screen down smoothly
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 5, 1)<CR>

" Ctrl-f: fzf
nnoremap <c-f> :Ag 

" Ctrl-g: GitFiles
nmap <c-g> :GitFiles<CR>

" Ctrl-h: Move word back. Consistent with zsh
noremap <c-h> B
inoremap <c-h> <c-o>B

" Ctrl-j: Scroll + move down through the file
" noremap <c-j> 5<c-e>5j
noremap <c-j> 5<c-e>

" Ctrl-k: Scroll + move up through the file
" noremap <c-k> 5<c-y>5k
noremap <c-k> 5<c-y>

" Ctrl-l: Move word forward. Consistent with zsh
noremap <c-l> W
inoremap <c-l> <c-o>W

" Ctrl-;: Vim can't map this

" Ctrl-': Vim can't map this

" Ctrl-z: This is the command key for tmux

" Ctrl-x: Cycle through the splits. I don't ever use enough splits to justify
" wasting 4 very easy to hit keys for them.
nnoremap <c-x> <c-w>w

" Ctrl-c: FZF commands
nnoremap <c-c> :Commands<CR>

" Ctrl-v: Paste (works with system clipboard due to clipboard setting earlier)
nnoremap <c-v> p

" Ctrl-b: Go to tag
nnoremap <c-b> <c-]>

" Ctrl-n: Next cursor in MultiCursor mode

" Ctrl-m: Same as Enter

" Ctrl-,: Vim can't map this

" Ctrl-.: Vim can't map this

" Ctrl-/: Vim can't map this

" Ctrl-Space: FZF files
nnoremap <NUL> :Files<CR>

"===============================================================================
" Insert Mode Ctrl Key Mappings
"===============================================================================

" Ctrl-q: Quoted insert. Useful for doing key binding

" Ctrl-w: Delete previous word, create undo point
inoremap <c-w> <c-g>u<c-w>

" Ctrl-e: Go to end of line
inoremap <c-e> <esc>A

" Ctrl-r: Insert register

" Ctrl-t: Indent shiftwidth

" Ctrl-y: Insert char above cursor
" TODO: When do I ever use this?

" Ctrl-u: Delete til beginning of line, create undo point
inoremap <c-u> <c-g>u<c-u>

" Ctrl-i: Tab

" Ctrl-o: Execute one normal mode command

" Ctrl-p: Auto complete previous
" TODO: When do I ever use this?

" Ctrl-a: Go to begin of line
inoremap <c-a> <esc>I

" Ctrl-s: Save
inoremap <c-s> <esc>:w<CR>

" Ctrl-d: Unindent shiftwidth

" Ctrl-f: Move cursor left
inoremap <c-f> <Left>

" Ctrl-g: Move cursor right
silent! iunmap <c-g>s
silent! iunmap <c-g>S
inoremap <c-g> <Right>

" Ctrl-h: Move word left
inoremap <c-h> <c-o>B

" Ctrl-j: Move cursor up
inoremap <expr> <c-j> pumvisible() ? "\<C-e>\<Down>" : "\<Down>"

" Ctrl-k: Move cursor up
inoremap <expr> <c-k> pumvisible() ? "\<C-e>\<Up>" : "\<Up>"

" Ctrl-l: Move word right
inoremap <c-l> <c-o>W

" Ctrl-z: This is the command key for tmux

" Ctrl-x: Delete char under cursor. (If we simply use x, it wouldn't delete
" newline chars
" inoremap <c-x> <right><c-o>X

" Ctrl-c: Inserts line below
inoremap <c-c> <c-o>o

" Ctrl-v: Paste. For some reason, <c-o> is not creating an undo point in the
" mapping
inoremap <c-v> <c-g>u<c-o>gP

" Ctrl-b: TODO

" Ctrl-n: Auto complete next

" Ctrl-m: Same as Enter

" Ctrl-space: YCM

" Ctrl-/: Undo
inoremap <c-_> <c-o>u

"===============================================================================
" Visual Mode Ctrl Key Mappings
"===============================================================================

" Ctrl-c: Copy (works with system clipboard due to clipboard setting)
vnoremap <c-c> y`]

" Ctrl-r: Easier search and replace
vnoremap <c-r> "hy:%s/<c-r>h//gc<left><left><left>

" Ctrl-s: Easier substitue
vnoremap <c-s> :s/\%V//g<left><left><left>

" Ctrl-f: Find highlight word with FZF
vnoremap <c-f> "hy:Ag <c-r>h<cr>

"===============================================================================
" Normal Mode Meta/Alt Key Mappings
"===============================================================================
" Fix alt key keycodes. Using keycodes instead of escape sequence for mapping will use ttimeout instead of timeout,
" which means pressing escape will not cause a delay.
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "set <A-".toupper(c).">=\e".toupper(c)
  let c = nr2char(1+char2nr(c))
endw

" Alt-a: Select all
nnoremap <silent> <A-a> :keepjumps normal ggVG<CR>

" Alt-s: isort and format
nnoremap <silent> <A-s> :Isort<CR>:Neoformat<CR>

" Alt-h: tmux

" Alt-j: Move current line down
nnoremap <silent> <A-j> mz:m+<cr>`z==

" Alt-k: Move current line up
nnoremap <silent> <A-k> mz:m-2<cr>`z==

" Alt-l: tmux

" Alt-Shift-j: Duplicate line down
nnoremap <silent> <A-J> mzyyp`zj

" Alt-Shift-k: Duplicate line up
nnoremap <silent> <A-K> mzyyp`z

" Alt-o: Jump back in the changelist
nnoremap <A-o> g;

" Alt-i: Jump forward in the changelist
nnoremap <A-i> g,

" Alt-n: tmux

"===============================================================================
" Insert Mode Meta/Alt Key Mappings
"===============================================================================

" Alt-j: Move current line down
" imap <A-j> <esc><m-j>a

" Alt-k: Move current line down
" imap <A-k> <esc><m-k>a

"===============================================================================
" Visual Mode Meta/Alt Key Mappings
"===============================================================================

" Alt-j: Move selections down
vnoremap <A-j> :m'>+<cr>`<my`>mzgv`yo`z

" Alt-k: Move selections up
vnoremap <A-k> :m'<-2<cr>`>my`<mzgv`yo`z

"===============================================================================
" Space Key Mappings
"===============================================================================

"===============================================================================
" Visual Mode Key Mappings
"===============================================================================

" y: Yank and go to end of selection
xnoremap y y`]

" p: Paste in visual mode should not replace the default register with the
" deleted text
xnoremap p "_dP

" J/K: Move visual block
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

" \: Toggle comment
xmap \ <Leader>c<space>

" Enter: Highlight visual selections
xnoremap <silent> <CR> y:let @/ = @"<cr>:set hlsearch<cr>

" Backspace: Delete selected and go into insert mode
xnoremap <bs> c

" Space: QuickRun
xnoremap <Space> :QuickRun<CR>

" <|>: Reselect visual block after indent
xnoremap < <gv
xnoremap > >gv

" .: repeats the last command on every line
xnoremap . :normal.<cr>

" @: repeats macro on every line
xnoremap @ :normal@

" Tab: Indent
xmap <c-i> >

" shift-tab: unindent
xmap <s-tab> <

"===============================================================================
" Operator Pending Mode Key Mappings
"===============================================================================

"===============================================================================
" Autocommands
"===============================================================================
function! CursorPing()
  set cursorline cursorcolumn
  redraw
  sleep 200m
  set nocursorline nocursorcolumn
endfunction

" q quits in certain page types. Don't map esc, that interferes with mouse input
autocmd MyAutoCmd FileType help,quickrun
      \ if (!&modifiable || &ft==#'quickrun') |
      \ nnoremap <silent> <buffer> q :q<cr>|
      \ nnoremap <silent> <buffer> <esc><esc> :q<cr>|
      \ endif
autocmd MyAutoCmd FileType qf nnoremap <silent> <buffer> q :q<CR>

" json = javascript syntax highlight
autocmd MyAutoCmd FileType json setlocal syntax=javascript

" Diff mode settings
" au MyAutoCmd FilterWritePre * if &diff | exe 'nnoremap <c-p> [c' | exe 'nnoremap <c-n> ]c' | endif
" Quickfix
autocmd MyAutoCmd FileType qf call AdjustWindowHeight(3, 50)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

"===============================================================================
" NERDTree
"===============================================================================
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.pyc', '__pycache__', '\.cache', '\.idea']
autocmd MyAutoCmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"===============================================================================
" NERDCommenter
"===============================================================================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"===============================================================================
" ALE
"===============================================================================
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\}
let g:ale_python_flake8_executable = 'python'
let g:ale_python_flake8_options = '-m flake8 --ignore=E501'

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
" QuickRun
"===============================================================================

" let g:quickrun_config = {}
" let g:quickrun_config['*'] = {
      " \ 'runner/vimproc/updatetime' : 100,
      " \ 'outputter' : 'buffer',
      " \ 'runner' : 'vimproc',
      " \ 'running_mark' : 'ﾊﾞﾝ（∩`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾞﾝ',
      " \ 'into' : 1,
      " \ 'runmode' : 'async:remote:vimproc'
      " \}
" QuickRun triggers markdown preview
" let g:quickrun_config.markdown = {
      " \ 'runner': 'vimscript',
      " \ 'command': ':InstantMarkdownPreview',
      " \ 'exec': '%C',
      " \ 'outputter': 'null'
      " \}

"===============================================================================
" Markdown
"===============================================================================
" These are ammended on top of the existing markdown settings from
" tpope/vim-markdown
autocmd MyAutoCmd FileType markdown call s:markdown_settings()
function! s:markdown_settings()
  " Auto insert bullet when constructing lists
  setlocal comments=b:-
  setlocal formatoptions+=ro
  setlocal wrap
  setlocal tw=0
  inoremap <buffer> <Tab> <C-t>
  " Since completion is off, reassign tab and shift-tab to indent and unindent
  " in insert mode
  inoremap <buffer> <S-Tab> <C-d>
  " Make the delete key in insert mode delete the bullet point in 1 keystroke
  inoremap <silent> <buffer> <bs> <C-r>=<SID>markdown_delete_key()<CR>
endfunction

function! s:markdown_delete_key()
  if getline(".") =~ '^\s*- $'
    return "\<bs>\<bs>"
  else
    return "\<bs>"
  endif
endfunction

"===============================================================================
" Go
"===============================================================================
autocmd MyAutoCmd FileType go
      \ setlocal nolist |
      \ setlocal softtabstop=8 |
      \ setlocal shiftwidth=8 |
      \ setlocal noexpandtab


"===============================================================================
" Python
"===============================================================================
autocmd MyAutoCmd FileType python
      \ setlocal softtabstop=4 |
      \ setlocal shiftwidth=4 |
      \ setlocal tabstop=4 |
      \ setlocal textwidth=140

"===============================================================================
" Expand Region
"===============================================================================
let g:expand_region_use_select_mode = 0

" Extend the global dictionary
call expand_region#custom_text_objects({
      \ 'a]'  :1,
      \ 'ab'  :1,
      \ 'aB'  :1,
      \ 'ii'  :0,
      \ 'ai'  :0,
      \ })

" Customize it further for ruby
call expand_region#custom_text_objects('ruby', {
      \ 'im' :0,
      \ 'am' :0,
      \ })

" Customize it further for html
call expand_region#custom_text_objects('html', {
      \ 'it' :1,
      \ })

"===============================================================================
" YCM
"===============================================================================
" let g:ycm_confirm_extra_conf = 0
" let g:EclimCompletionMethod = 'omnifunc'
" let g:ycm_filetype_blacklist = {
"       \ 'notes' : 1,
"       \ 'markdown' : 1,
"       \ 'text' : 1,
"       \}

"===============================================================================
" vim-autoformat
"===============================================================================
let g:formatters_python = ['yapf']
let g:formatdef_yapf = '"yapf --style=''{based_on_style:pep8,indent_width:".&shiftwidth."}'' -l ".a:firstline."-".a:lastline'

"===============================================================================
" Neoformat
"==============================================================================
let g:neoformat_enabled_python = ['autopep8', 'yapf']
let g:neoformat_python_autopep8 = {
            \ 'exe': 'autopep8',
            \ 'args': ['-', '--indent-size 4', '--max-line-length 140'],
            \ 'stdin': 1,
            \ }

"===============================================================================
" EasyMotion
"===============================================================================
" let g:EasyMotion_do_mapping = 0 " Disable default mappings
" nmap s <Plug>(easymotion-overwin-f2)
" " Turn on case insensitive feature
" let g:EasyMotion_smartcase = 1

"===============================================================================
" AutoPair
"===============================================================================
let g:AutoPairsMapCh = 0

"===============================================================================
" Vimwiki
"===============================================================================
let g:vimwiki_list = [{'path': '~/gdrive/Notes/vimwiki/', 'path_html': '~/gdrive/Notes/vimwiki_html/'}]
let g:vimwiki_table_mappings = 0
nmap <Leader>wk <Plug>VimwikiDiaryPrevDay
nmap <Leader>wj <Plug>VimwikiDiaryNextDay


"===============================================================================
" Gist
"===============================================================================
let g:gist_post_private = 1

"===============================================================================
" FZF
"===============================================================================
" let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
" let $FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

"===============================================================================
" My functions
"===============================================================================

command! -nargs=+ Silent
      \ | execute ':silent !'.<q-args>
      \ | execute ':redraw!'

" Format json using python. This needs some better error checking
command! -nargs=0 -range=% Format 
      \ <line1>,<line2>!python -c "import sys, json, collections; print json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), sort_keys=False, indent=2)"

" Copy the absolute path of current file to clipboard
command! CopyPath :let @*=expand("%:p")

" Execute 'cmd' while redirecting output.
" Delete all lines that do not match regex 'filter' (if not empty).
" Delete any blank lines.
" Delete '<whitespace><number>:<whitespace>' from start of each line.
" Display result in a scratch buffer.
function! s:Filter_lines(cmd, filter)
  let save_more = &more
  set nomore
  redir => lines
  silent execute a:cmd
  redir END
  let &more = save_more
  new
  setlocal buftype=nofile bufhidden=hide noswapfile
  put =lines
  g/^\s*$/d
  %s/^\s*\d\+:\s*//e
  if !empty(a:filter)
    execute 'v/' . a:filter . '/d'
  endif
  0
endfunction
command! -nargs=? Scriptnames call s:Filter_lines('scriptnames', <q-args>)
