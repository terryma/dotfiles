" Disable vi-compatibility
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.dotfiles/.vim/bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Google specific settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
  source ~/.vimrc.google
catch
endtry

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map leader and localleader key to comma
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

" Order by key location

" ✓ <Leader>1: Toggle between paste mode
nnoremap <silent> <leader>1 :set paste!<cr>

" ✓ <Leader>2: Toggle Tagbar
nnoremap <leader>2 :TagbarToggle<cr>

" ✓ <Leader>3: Run the visually selected code in python and replace it with the
" output
vnoremap <silent> <leader>0 :!python<cr>

" <Leader>3: Open tasklist
nnoremap <Leader>3 :TaskList<cr>

" ✓ <Leader>tab: Toggles NERDTree
nnoremap <leader><tab> :NERDTreeToggle<cr>

" ✓ <Leader>q: Quit all, very useful in vimdiff
nnoremap <leader>q :qa<cr>

" ✓ <Leader>w: Save
nnoremap <leader>w :w<cr>

" ✓ <Leader>e: Fast editing of the .vimrc
nnoremap <leader>e :e! $MYVIMRC<cr>

" ✓ <Leader>r: QuickRun's default keymap

" <leader>t: unused

" <leader>o: only
nnoremap <leader>o :only<cr>

" ✓ <leader>af: find the highlighted word or the word under cursor on the
" current buffer using ack (a for ack)
vnoremap <leader>af y:<c-u>Ack! -q '<c-r>"' %<cr>
nnoremap <leader>af :Ack! -Q '<c-r><c-w>' %<cr>

" ✓ <leader>ad: search the highlighted word or the word under cursor using ack
" (s for search)
vnoremap <leader>ad y:<c-u>Ack! -qu '<c-r>"'<cr>
nnoremap <leader>ad :Ack! -Qu '<c-r><c-w>'<cr>

" ✓ <leader>d: copy line down (d for duplicate)
nnoremap <leader>d mzyyp`zj

" <Leader>f: NERDTreeFind
nnoremap <silent> <leader>f :NERDTreeFind<cr> :wincmd p<cr>

" <Leader>g: unused

" <Leader>z: unused

" <Leader>x: unused

" ✓ <Leader>cd: Switch to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" <Leader>v: quick vertical split
nnoremap <leader>v :vsp<cr>

" <Leader>n: unused

" <Leader>p: Copy the full path of the current file to the clipboard
nnoremap <silent> <leader>p :let @+=expand("%:p")<cr>:echo "Copied current file
      \ path '".expand("%:p")."' to clipboard"<cr>

" ✓ <Leader>.: List all the snippets for the current files
" nnoremap <leader>. :call UltiSnips_ListSnippets()<cr>

" <Leader><space>: unused

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command mode key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bash like keys for the command line
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-j> <up>
cnoremap <c-k> <down>

" Ctrl-[hl]: Moves left/right by word, since Shift-left/right are used by tmux
" to switch panes
cnoremap <c-h> <s-left>
cnoremap <c-l> <s-right>

" Paste to command mode using Ctrl-V
cnoremap <c-v> <c-r>"

" w!: Change ro files to rw
function! g:chmodonwrite()
  if v:cmdbang
    silent !chmod u+w %
  endif
endfunction
autocmd bufwrite * call g:chmodonwrite()

" w!!: Writes using sudo
cnoremap w!! w !sudo tee % >/dev/null

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Normal Mode Shift key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ✓ Q: Closes the window
nnoremap Q :q<cr>

" ✓ W: Move word forward

" ✓ E: Move to end of word forward

" ✓ R: Replace mode

" ✓ T: Finds till backwards

" ✓ Y: Remove join lines to this, Y looks like a join of two lines into one
nnoremap Y J

" ✓ U: Redos since 'u' undos
nnoremap U <c-r>

" ✓ I: Insert at beginning of line

" ✓ O: Insert line above

" ✓ P: Paste above line

" ✓ {: Beginning of paragraph

" ✓ }: End of paragraph

" |: Beginning of line

" ✓ A: Insert at end of line

" ✓ S: Deletes the line and puts us in insert mode

" ✓ D: Deletes til the end of line

" ✓ F: Finds backwards

" ✓ G: Go to end of file

" ✓ H: Go to beginning of line
noremap H ^

" ✓ J: Scroll down, Ctrl-e is a little difficult to reach
nmap J <c-e>

" ✓ K: Scroll up, Ctrl-y is a difficult to reach
nmap K <c-y>
" TODO Remap the previous functionality of K to something else?

" ✓ L: Go to end of line
noremap L $

" ✓ ::: Go to command-line mode. Since ; is also used to go to command-line mode,
" : should be mapped to what ; used to do (next when doing fFtT). But since
" we're using EasyMotion to replace what fFtT used to do, it renders ; obsolete

" ✓ ": Handles registers

" TODO Z: Nothing by itself, ZZ = :x<cr>

" ✓ X: Deletes character backward

" ✓ C: Deletes rest of line and go to insert mode

" ✓ V: Visual line mode

" ✓ B: Move word backward

" ✓ N: Find next occurrence backward
nnoremap N Nzzzv

" TODO M: Move cursor to mid screen

" ✓ <: Indent left

" ✓ >: Indent right

" ✓ ?: Search backwards

" +: Increment number
nnoremap + <c-a>
nnoremap - <c-x>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Normal Mode Ctrl key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ✓ Ctrl-q: Visual block mode

" ✓ Ctrl-w: Window management

" TODO Ctrl-e: Scroll down, move the cursor as well
" This is mapped to Shift-J, remap to something else?
nnoremap <c-e> 3<c-e>3j

" TODO Ctrl-r: Redo
" This is mapped to Shift-U, remap to something else?

" TODO Ctrl-y: Scroll up, move the cursor as well
" This is mapped to Shift-K, remap to something else?
nnoremap <c-y> 3<c-y>3k

" Ctrl-t: Go back in tag stack

" Ctrl-t*: Tab operations
nnoremap <c-t>n :tabnew<cr>
nnoremap <c-t>w :tabclose<cr>
nnoremap <c-t>j :tabprev<cr>
nnoremap <c-t>h :tabprev<cr>
nnoremap <c-t>k :tabnext<cr>
nnoremap <c-t>l :tabnext<cr>
let g:lasttab = 1
nnoremap <c-t>t :exe "tabn ".g:lasttab<cr>
au TabLeave * let g:lasttab = tabpagenr()

" TODO Ctrl-u: Scroll half a screen up
" Do I use this much?

" ✓ Ctrl-i: Go forward in the jumplist, also realign the screen
nnoremap <c-i> <c-i>zzzv

" ✓ Ctrl-o: Go back in the jumplist, also realign the screen
nnoremap <c-o> <c-o>zzzv

" ✓ Ctrl-p: Open CtrlP
nnoremap <c-p><c-p> :CtrlP<cr>
nnoremap <c-p><c-t> :CtrlPBufTag<cr>
nnoremap <c-p><c-l> :CtrlPLine<cr>
nnoremap <c-p><c-b> :CtrlPBookmarkDir<cr>

" ✓ Ctrl-[: Esc

" ✓ Ctrl-]: Go forward in tag stack

" ✓ Ctrl-a: Select all
nnoremap <c-a> ggvGg_

" TODO Ctrl-s: Save
" Hitting ;w<cr> are pretty simple, remap to something more useful?
nnoremap <c-s> :w<cr>

" TODO Ctrl-d: Scroll half a screen down
" Do I use this much?

" TODO Ctrl-f: Scroll one full screen down
" Do I use this much?
nnoremap <c-f> :CtrlPLine<cr>

" Ctrl-g: Prints current file name. 1Ctrl-g prints the full path
" TODO Do I use this much? Can we just have the full path displayed at all time?

" ✓ Ctrl-[hjkl]: Smart way to move around windows
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l

" ✓ Ctrl-;: Vim can't map this

" ✓ Ctrl-': Go to mark

" ✓ Ctrl-z: This is the command key for tmux

" TODO Ctrl-x: unused

" TODO Ctrl-c: unused

" ✓ Ctrl-v: Paste system clipboard
nnoremap <c-v> :set paste<cr>"+gP:set nopaste<cr>

" ✓ Ctrl-b: CtrlP buffer mode
nnoremap <c-b> :CtrlPBuffer<cr>

" ✓ Ctrl-n: Toggle relative line number
nnoremap <c-n> :set invrelativenumber<cr>

" ✓ Ctrl-m: Same as Enter

" ✓ Ctrl-,: Vim can't map this
" ✓ Ctrl-.: Vim can't map this
" ✓ Ctrl-/: Vim can't map this

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert Mode Ctrl key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl-[hjkl]: Move in insert mode
inoremap <c-h> <left>
inoremap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<down>"
inoremap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<up>"
inoremap <c-l> <right>

" Disable Ctrl-C, that's a bad habit, use Ctrl-[, capslock, or jk instead

" TODO Map it to something useful
inoremap <c-c> <nop>

" Ctrl-backspace: Delete previous word (Doesn't work in terminal)
inoremap <c-bs> <c-w>

" basic readline shortcuts
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" Scroll faster & move cursor too
vnoremap <c-e> 3<c-e>3j
vnoremap <c-y> 3<c-y>3k

" Copy and paste to the system clipboard using Ctrl-C and Ctrl-V
" Disable this in normal node since it conflicts with visual block mode
" The 'g' right after the register name means leave the cursor after the text
" Notice that clipboard=unnamed is not set for OSX, since we want the clipboard
" copy/paste to be explicit
inoremap <c-v> <esc>:set paste<cr><esc>"+gp:set nopaste<cr>a
vnoremap <c-c> "+y

" Easier search and replace
vnoremap <c-r> "hy:%s/<c-r>h//gc<left><left><left>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Meta key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Normal Mode
" Alt-[hl]: Move word in normal mode
nnoremap <m-h> hgEl
nnoremap <m-l> El

" Alt-[jk]: Move current line up or down
nnoremap <m-j> mz:m+<cr>`z
nnoremap <m-k> mz:m-2<cr>`z

" Alt-o: Jump back in the changelist
nnoremap <m-o> g;

" Alt-i: Jump forward in the changelist
nnoremap <m-i> g,

" Alt-t: Open CtrlP's tag search, similar to Eclipse's Ctrl-o
nnoremap <m-t> :CtrlPBufTag<cr>

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Normal Mode:
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
" \: Comment
" a: Insert after cursor
" s: Substitute
" d: Delete
" f: Find 
" g: Many functions
" h: Left
" j: Down
" k: Up
" l: Right
" ;: Command mode
noremap ; :
" ': Go to mark
" z: Many functions
" x: Delete char
" c: Change
" v: Visual mode
" b: Move word backward
" n: Next, keep search matches in the middle of the window
nnoremap n nzzzv
" m: Marks
" ,: Repeat last f,F,t,T reverse  (Remap?)
" .: Repeat last command
" /" Search

" Replace the normal fFtF keys with EasyMotion
let g:EasyMotion_mapping_f = 'f'
let g:EasyMotion_mapping_F = 'F'
let g:EasyMotion_mapping_t = 't'
let g:EasyMotion_mapping_T = 'T'

" Disable arrow keys, they're evil
nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>

" Enter: Add new line
nnoremap <cr> o<esc>

" Backspace: Turn off search highlight
nnoremap <silent> <bs> :noh<cr>

" Space: Toggle folding
nnoremap <space> za
vnoremap <space> za

" Visual Mode:
" Paste in visual mode should not replace the default register with the deleted
" text
vnoremap p "_dP

" Highlight visual selections
vnoremap * y:let @/ = @"<cr>

" make backspace work sanely in visual mode
vnoremap <bs> x

" Remap VIM 0
noremap 0 ^

" Restart vim with Ctrl-Alt-R when in gui
if has('gui_running')
  nmap <C-M-r> :RestartVim<CR>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the mouse, since it doesn't play well with tmux anyway. This way I can
" scroll in the terminal
set mouse=a

set virtualedit=onemore

" Use relative numbering to help with motion
set relativenumber

" Always splits to the right and below
set splitright
set splitbelow

" Turn on line highlighting
set cursorline

set background=dark

" Colorschemes
" colorscheme jellybeans
" colorscheme base16-tomorrow
colorscheme Tomorrow-Night

" Sets how many lines of history vim has to remember
set history=10000

" Set to auto read when a file is changed from the outside
set autoread

" Set to auto write file
set autowrite

" Display unprintable chars
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Enables the /g flag on :s substitutions by default
" set gdefault

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=10

" Open all folds initially
set foldmethod=indent
set foldlevelstart=99

" Show mode
set showmode

" Auto complete setting
set completeopt=longest,menuone,preview

" Set completion mode. First tab completes as much as possible, second tab shows
" list of options
set wildmode=longest,list,full
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

" Always show the statusline
set laststatus=2

" Explicitly set encoding to utf-8
set encoding=utf-8

" Column width indicator
set colorcolumn=+1 

" Lower the delay of escaping out of other modes
set timeout timeoutlen=1000 ttimeoutlen=0

if !has('gui_running')
  " Fix meta-keys which generate <Esc>a .. <Esc>z
  let c='a'
  while c <= 'z'
    exec "set <M-".c.">=\e".c
    exec "imap \e".c." <M-".c.">"
    let c = nr2char(1+char2nr(c))
  endw
endif


" Reload vimrc when edited, also reload the powerline color
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC
        \ | call Pl#Load() | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Set font according to system
if has("macunix")
  set gfn=menlo\ for\ powerline:h12
elseif has("unix")
  set gfn=Ubuntu\ Mono\ for\ Powerline\ 12
elseif has("win32")
  set gfn=consolas:h12
endif

" 256bit terminal
set t_Co=256

" Disable menu and toolbar
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
set nowrap 
set whichwrap+=h,l,<,>,[,]

set guitablabel=%t

set clipboard-=autoselect

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
nnoremap <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
nnoremap <leader>sn ]s
nnoremap <leader>sp [s
nnoremap <leader>sa zg
nnoremap <leader>s? z=
nnoremap <leader>s1 1z=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
" only start if no file is specified (this appears to cause powerline to not
" show up correctly inside of tmux for some strange reason. Disable it for now
" autocmd vimenter * if !argc() | NERDTree | wincmd p | endif
" close vim if the only window open is nerdtree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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

" This currently doesn't work very well with quickrun and vimshell. Disable
" until I can figure out how to fix it
" autocmd BufEnter * call rc:syncTree()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD Commenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always leave a space between the comment character and the comment
let NERDSpaceDelims=1

" \\: Toggle comment
map \\ <leader>c<space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use the fancy version of Powerline symbols
let g:Powerline_symbols = 'fancy'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic settings
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': ['ruby', 'php'],
            \ 'passive_filetypes': ['puppet'] }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>gr :Gremove<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show hidden files
let g:ctrlp_show_hidden=1
" Show up to 20 lines
let g:ctrlp_max_height=20
let g:ctrlp_working_path_mode = 'ra'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyMotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neocomplcache
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : ""
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
imap <expr><cr> pumvisible() ? neocomplcache#close_popup() . "\<tab>" : "\<cr>"

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Tell Neosnippets to use the snipmate snippets
let g:neosnippet#snippets_directory='~/.dotfiles/.vim/bundle/snipmate-snippets,~/.dotfiles/.vim/snippets'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clam
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap ! :Clam<space>
vnoremap ! :ClamVisual<space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimSessions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically save and load sessions
let g:session_autosave="yes"
let g:session_autoload="yes"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Calendar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:calendar_options="fdc=0 nornu"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Refactor()
  call inputsave()
  let @z=input("What do you want to rename '" . @z . "' to? ")
  call inputrestore()
endfunction
" Locally (local to block) rename a variable
nnoremap <Leader>rf "zyiw:call Refactor()<cr>mx:silent! norm gd<cr>[{V%:s/<C-R>//<c-r>z/g<cr>`x
