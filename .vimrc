autocmd!                                                                                                                                                                                     
"colorscheme torte
colorscheme desert

syntax on
filetype plugin indent on

vmap <silent> sy :!pbcopy pbpaste<CR>
map <silent> sp <esc>0<esc>v:!pbpaste<CR>

set enc=utf-8

if has('gui_macvim')
    set showtabline=2	" タブを常に表示
    set imdisable	" IMを無効化
    set transparency=10	" 透明度を指定
    set antialias
    set guifont=Monaco:h14
    colorscheme macvim
endif

set noimdisableactivate

" neobundle
set nocompatible
filetype off

if has('vim_starting')
        set runtimepath+=~/.bundle/neobundle.vim
        call neobundle#rc(expand('~/.bundle'))
endif

"NeoBundle 'git://github.com/Shougo/clang_complete.git'
NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
"NeoBundle 'git://github.com/Shougo/unite.vim.git'
"NeoBundle 'git://github.com/Shougo/vim-vcs.git'
"NeoBundle 'git://github.com/Shougo/vimfiler.git'
"NeoBundle 'git://github.com/Shougo/vimshell.git'
"NeoBundle 'git://github.com/Shougo/vinarise.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
"NeoBundle "http://www.vim.org/scripts/download_script.php?src_id=4976"

filetype plugin on
filetype indent on


nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>
nnoremap <Space>S. :<C-u>source $MYVIMRC<Enter>

nnoremap j gj
nnoremap k gk
nnoremap gk k
nnoremap gj j

nnoremap <C-e> :QuickRun<Enter>

set number

"status line
set laststatus=2
set showcmd
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"cursorline
set cursorline

"<F6>  文頭にタイムスタンプを挿入してinsertモードへ移行nmap <F6> -- <ESC>i<C-R>=strftime("%Y/%m/%d (%a) %H:%M")<CR> --<CR>
nmap <F6> <ESC>i -- <C-R>=strftime("%Y/%m/%d (%a) %H:%M")<CR> --<CR>
