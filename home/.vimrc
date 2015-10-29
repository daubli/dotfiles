" ============================================================================
" Vundle initialization
" Avoid modify this section, unless you are very sure of what you are doing

" set bash as vim shell
set shell=/bin/bash

" no vi-compatible
set nocompatible

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" Plugins from github repos:

" Better file browser
Bundle 'scrooloose/nerdtree'
" Code commenter
Bundle 'scrooloose/nerdcommenter'
" Class/module browser
Bundle 'majutsushi/tagbar'
" Code and files fuzzy finder
Bundle 'kien/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
Bundle 'fisadev/vim-ctrlp-cmdpalette'
" Zen coding
Bundle 'mattn/emmet-vim'
" Git integration
Bundle 'tpope/vim-fugitive'
" Tab list panel
Bundle 'kien/tabman.vim'
" Airline
Bundle 'bling/vim-airline'
" Terminal Vim with 256 colors colorscheme
Bundle 'fisadev/fisa-vim-colorscheme'
" Surround
Bundle 'tpope/vim-surround'
" auto-pairs
Bundle 'jiangmiao/auto-pairs'
" Indent text object
Bundle 'michaeljsmith/vim-indent-object'
" highlight intendation
Bundle 'nathanaelkane/vim-indent-guides'
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Bundle 'klen/python-mode'
" Better autocompletion
Bundle 'Shougo/neocomplcache.vim'
" Snippets manager (SnipMate), dependencies, and snippets repo
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
" Git/mercurial/others diff icons on the side of the file lines
Bundle 'mhinz/vim-signify'
" Automatically sort python imports
" Bundle 'fisadev/vim-isort'
" Drag visual blocks arround
Bundle 'koljakube/vim-dragvisuals'
" Window chooser
Bundle 't9md/vim-choosewin'
" Python and other languages code checker
Bundle 'scrooloose/syntastic'
" Vim NERDTree Tabs
Bundle 'jistr/vim-nerdtree-tabs'
" vim commentary
Bundle 'tpope/vim-commentary'
" zoom panes
Bundle 'regedarek/ZoomWin'
" python virtualenv integration
Bundle 'jmcantrell/vim-virtualenv'

" Plugins from vim-scripts repos:

" Search results counter
Bundle 'IndexedSearch'
" XML/HTML tags navigation
Bundle 'matchit.zip'
" Yank history navigation
Bundle 'YankRing.vim'


" ============================================================================
" Install plugins the first time vim runs

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    exec "BundleInstall"
    exec "qall"
endif

" ============================================================================
" Vim settings and mappings
" You can edit them as you wish

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" always show status bar
set ls=2

" incremental search
set incsearch

" highlighted search results
set hlsearch

" syntax highlight on
syntax on

" show line numbers
set nu

" enable mouse scrolling
set mouse=a

" disable line break
set nowrap

" set Leader Key
let mapleader=","

" set timeout for waiting on commands like <Leader>...
set timeout
set timeoutlen=1000

" use clipboard for vim standard register
set clipboard=unnamedplus

" tab navigation mappings
map t. :tabn<CR>
map t, :tabp<CR>
map tm :tabm 
map tn :tabnew 
map ts :tab split<CR>

" buffer next/prev
map <Leader>. :bn<CR>
map <Leader>, :bp<CR>
" close buffer
map <Leader>d :bd<CR>

" faster safe and close shortcuts
map <Leader>s <Esc>:w<CR>
inoremap <Leader>s <Esc>:w<CR>a
map <Leader>S <Esc>:w !sudo tee %<CR>
inoremap <Leader>S <Esc>:w !sudo tee %<CR>a
map <Leader>q <Esc>:q<CR>
map <Leader>Q <Esc>:q!<CR>
map <Leader>a <Esc>:qa<CR>
map <Leader>A <Esc>:qa!<CR>
map <Leader>x <Esc>:x<CR>
map <Leader>X <Esc>:x!<CR>
inoremap <Leader>x <Esc>:x<CR>
map <Leader>c <Esc>:hide<CR>

" navigate windows with leader + (h,j,k,l)
map <Leader>h <C-w>h
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>l <C-w>l

" reorder windows with leader + (H,J,K,L)
map <Leader>H <C-w>H
map <Leader>J <C-w>J
map <Leader>K <C-w>K
map <Leader>L <C-w>L

" toggle zoom window with leader + o
map <Leader>o <C-w>o

" set paste and nopaste shortcuts
nmap <Leader>p :set paste<CR>
nmap <Leader>P :set nopaste<CR>
inoremap <Leader>p <Esc>:set paste<CR>i

" cancel autocompletion popup
" inoremap <expr> <SID>org-mapping neocomplcache#cancel_popup()
" imap <C-j> <SID>org-mapping<CR>
imap <C-j> <Esc>$o
imap <C-l> <Esc>A

" don't use ESC anymore
inoremap jj <Esc>l

" save as sudo
ca w!! w !sudo tee "%"

" intendation colors
colorscheme default
let g:indent_guides_enable_on_vim_startup = 1 
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236


" simple recursive grep
" both recursive grep commands with internal or external (fast) grep
command! -nargs=1 RecurGrep lvimgrep /<args>/gj ./**/*.* | lopen | set nowrap
command! -nargs=1 RecurGrepFast silent exec 'lgrep! <q-args> ./**/*.*' | lopen
" mappings to call them
nmap <Leader>R :RecurGrep 
nmap <Leader>r :RecurGrepFast 
" mappings to call them with the default word as search text
nmap <Leader>wR :RecurGrep <cword><CR>
nmap <Leader>wr :RecurGrepFast <cword><CR>

" use 256 colors when possible
if &term =~? 'mlterm\|xterm\|xterm-256\|screen-256'
	let &t_Co = 256
    colorscheme fisa
else
    colorscheme delek
endif

" colors for gvim
if has('gui_running')
    colorscheme wombat
endif

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
if has('persistent_undo')
    set undofile                      " persistent undos - undo after you re-open the file
    set undodir=~/.vim/dirs/undos
    if !isdirectory(&undodir)
        call mkdir(&undodir, "p")
    endif
endif
set viminfo+=n~/.vim/dirs/viminfo
" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif

" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" Tagbar ----------------------------- 

" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" NERDTree ----------------------------- 

" open nerdtree with the current file selected
nmap <Leader>t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']


" Tasklist ------------------------------

" show pending tasks list
map <F2> :TaskList<CR>


" CtrlP ------------------------------

" file finder mapping
let g:ctrlp_map = ',e'
" tags (symbols) in current file finder mapping
nmap <Leader>g :CtrlPBufTag<CR>
" tags (symbols) in all files finder mapping
nmap <Leader>G :CtrlPBufTagAll<CR>
" general code finder in all files mapping
nmap <Leader>f :CtrlPLine<CR>
" recent files finder mapping
nmap <Leader>m :CtrlPMRUFiles<CR>
" commands finder mapping
nmap <Leader>b :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" same as previous mappings, but calling with current word as default text
nmap <Leader>wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap <Leader>wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap <Leader>wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap <Leader>we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap <Leader>wx :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap <Leader>wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap <Leader>wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" don't change working directory
let g:ctrlp_working_path_mode = 0
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }

" Syntastic ------------------------------

" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 0
" custom icons (enable them if you use a patched font, and enable the previous 
" setting)
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '⚠'
"let g:syntastic_style_error_symbol = '✗'
"let g:syntastic_style_warning_symbol = '⚠'

" Python-mode ------------------------------

" don't use linter, we use syntastic for that
let g:pymode_lint_on_write = 0
let g:pymode_lint_signs = 0
" don't fold python code on open
let g:pymode_folding = 0
" don't load rope by default. Change to 1 to use rope
let g:pymode_rope = 0
" open definitions on same window, and custom mappings for definitions and
" occurrences
let g:pymode_rope_goto_definition_bind = ',d'
let g:pymode_rope_goto_definition_cmd = 'e'
nmap <Leader>D :tab split<CR>:PymodePython rope.goto()<CR>
" nmap <Leader>o :RopeFindOccurrences<CR>

" NeoComplCache ------------------------------

" most of them not documented because I'm not sure how they work
" (docs aren't good, had to do a lot of trial and error to make 
" it play nice)
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_manual_completion_start_length = 1
let g:neocomplcache_min_keyword_length = 1
let g:neocomplcache_min_syntax_length = 1
" complete with workds from any opened file
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_'

" TabMan ------------------------------

" mappings to toggle display, and to focus on it
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" DragVisuals ------------------------------

" mappings to move blocks in 4 directions
vmap <expr> <S-M-LEFT> DVB_Drag('left')
vmap <expr> <S-M-RIGHT> DVB_Drag('right')
vmap <expr> <S-M-DOWN> DVB_Drag('down')
vmap <expr> <S-M-UP> DVB_Drag('up')
" mapping to duplicate block
vmap <expr> D DVB_Duplicate()

" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
" nmap <leader>sn <plug>(signify-next-hunk)
" nmap <leader>sp <plug>(signify-prev-hunk)

" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Window Chooser ------------------------------

" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

" Airline ------------------------------

let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '│'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#displayed_head_limit = 10

" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on the README.rst)
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


" make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" toggle NERDTree - default open NT is caused by vim-nerdtree-tabs
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" This unsets the 'last search pattern' register by hitting return
nnoremap <Space> :noh<CR>

" leave visual mode by hitting the space key
vnoremap <Space> <ESC>

" set highlighted cursorline
set cursorline
hi CursorLine ctermbg=235


" Better Search (f,F,t,T) ------------------------------

let [pvft,pvftc]=[1,32]
fun! Multift(x,c,i)
    let [g:pvftc,g:pvft]=[a:c,a:i]
    let pos=searchpos((a:x==2? mode(1)=='no'? '\C\V\_.\zs' : '\C\V\_.' : '\C\V').(a:x==1 && mode(1)=='no' || a:x==-2? nr2char(g:pvftc).'\zs' : nr2char(g:pvftc)),a:x<0? 'bW':'W')
    call setpos("'x", pos[0]? [0,pos[0],pos[1],0] : [0,line('.'),col('.'),0]) 
    return "`x"
endfun
no <expr> F Multift(-1,getchar(),-1)
no <expr> f Multift(1,getchar(),1)
no <expr> T Multift(-2,getchar(),-2)
no <expr> t Multift(2,getchar(),2)
no <expr> ; Multift(pvft,pvftc,pvft)
" no <expr> , Multift(-pvft,pvftc,pvft)

let g:yankring_history_dir = '~/.vim/dirs/'

" dragvisuals
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

"====[ Swap v and CTRL-V, because Block mode is more useful that Visual mode "]======
nnoremap    v   <C-V>
nnoremap <C-V>     v

vnoremap    v   <C-V>
vnoremap <C-V>     v