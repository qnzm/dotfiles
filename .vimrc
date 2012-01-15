" include:
" source $HOME/dotfiles/.vimrc

autocmd!
syntax on
filetype plugin indent on

"colorscheme
"colorscheme torte
"colorscheme desert
colorscheme koehler

set backspace=eol,indent,start
set ignorecase
set smartcase
set number

vmap <silent> sy :!pbcopy pbpaste<CR>
map <silent> sp <esc>0<esc>v:!pbpaste<CR>


"GUI
"encoding
"hide menubar & toolbar
if has('gui_running') && !has('unix')
  winpos 0 0
  set encoding=utf-8
  set guioptions-=T
  set guioptions-=m
  set clipboard=unnamed
endif
"Mac
if has('gui_macvim')
    set showtabline=2	
    set imdisable	
    set transparency=10	
    set antialias
    set guifont=Monaco:h14
    colorscheme macvim
    nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>
    nnoremap <Space>S. :<C-u>source $MYVIMRC<Enter>
    set imdisableactivate
endif

" neobundle
set nocompatible
filetype off

if has('vim_starting')
        set runtimepath+=~/.bundle/neobundle.vim
        call neobundle#rc(expand('~/.bundle'))
endif

NeoBundle 'git://github.com/tsaleh/vim-align.git'
"NeoBundle 'git://github.com/Shougo/clang_complete.git'
NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
"NeoBundle 'git://github.com/Shougo/vim-vcs.git'
"NeoBundle 'git://github.com/Shougo/vinarise.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/vim-scripts/mru.vim.git'

NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'

"neobundle javascript
NeoBundle 'JavaScript-syntax'
NeoBundle 'pangloss/vim-javascript'

filetype plugin on
filetype indent on

nnoremap j gj
nnoremap k gk
nnoremap gk k
nnoremap gj j

"cursor line
autocmd winenter * setlocal cursorline
autocmd winleave * setlocal nocursorline

nnoremap <C-e> :QuickRun<Enter>

set number

"status line
set laststatus=2
set showcmd
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"cursorline
set cursorline

"日付挿入
nmap <F6> <ESC>i -- <C-R>=strftime("%Y/%m/%d (%a) %H:%M")<CR> --<CR>

"history
set history=100 " keep 100 lines of command line history

"search hilight
nnoremap <ESC><ESC> :noh<Enter>

"http://vim-users.jp/2010/02/hack125/
set virtualedit+=block

set lcs=tab:>.,eol:$,trail:_,extends:\

"cd.vim : auto cd
au   BufEnter *   execute ":lcd " . expand("%:p:h") 

"encode
"set encoding=utf-8
command! Cp932 edit ++enc=cp932
command! Eujp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2022-p
command! Utf8 edit ++enc=utf-8

command! Jis Iso2022jp
command! Sjis Cp9312

"select all
nnoremap gc `[v`]
vnoremap gc :<c-u>normal gc<enter>
onoremap gc :<c-u>normal gc<enter>

"help
nnoremap <c-h> :<c-u><space>help<space>
nnoremap <c-h><c-h> :<c-u>help<space><c-r><c-w><enter>

"edit .vimrc
nnoremap <space>. :<c-u>edit $MYVIMRC<enter>
nnoremap <space>s. :<c-u>source $MYVIMRC<enter>

"clipboard
set clipboard=unnamed

"ejs filetype
autocmd BufNewFile,BufRead *.ejs set filetype=html

" neocomplcache
let g:neocomplcache_enable_at_startup = 1

" jslint
autocmd FileType javascript :compiler gjslint
autocmd QuickfixCmdPost make copen

