set hidden
set backup
set relativenumber
syntax on
set background=dark
set tabstop=4
"set autoindent
"set expandtab
"set softtabstop=0 noexpandtab
set shiftwidth=4 "smarttab
set nowrap

"set cursorline
"set wildmenu
set laststatus=2
"set lazyredraw
"set showmatch
"set showcmd
"set incsearch
highlight VertSplit cterm=NONE
set showtabline=2
set noshowmode
"set noshowcmd
"hi clear CursorLine
let loaded_matchparen = 1
nnoremap <silent> <esc> :noh<cr><esc>
"set rtp+=/usr/share/powerline/bindings/vim
set hlsearch

set directory=~/.vim/.swp//
set backupdir=~/.vim/.backup//
set undodir=~/.vim/.undo//

set foldenable
set foldlevelstart=10

set foldnestmax=10
nnoremap <space> za
set foldmethod=indent
nnoremap j gj
nnoremap k gk

nnoremap B ^
nnoremap E $
noremap gV `[v`]
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vimwiki/vimwiki'
call vundle#end()            " required

set rtp+={repository_root}/powerline/bindings/vim

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

" Use 256 colours (Use this setting only if your terminal supports 256
set t_Co=256

"disable F1 help
noremap <F1> <nop>

" auto pair brackets
"inoremap <left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"noremap [ []<left>
"inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"disable mouse
set mouse=
set ttymouse=

nmap <ScrollWheelUp> <nop>
nmap <S-ScrollWheelUp> <nop>
nmap <C-ScrollWheelUp> <nop>
nmap <ScrollWheelDown> <nop>
nmap <S-ScrollWheelDown> <nop>
nmap <C-ScrollWheelDown> <nop>
nmap <ScrollWheelLeft> <nop>
nmap <S-ScrollWheelLeft> <nop>
nmap <C-ScrollWheelLeft> <nop>
nmap <ScrollWheelRight> <nop>
nmap <S-ScrollWheelRight> <nop>
nmap <C-ScrollWheelRight> <nop>

imap <ScrollWheelUp> <nop>
imap <S-ScrollWheelUp> <nop>
imap <C-ScrollWheelUp> <nop>
imap <ScrollWheelDown> <nop>
imap <S-ScrollWheelDown> <nop>
imap <C-ScrollWheelDown> <nop>
imap <ScrollWheelLeft> <nop>
imap <S-ScrollWheelLeft> <nop>
imap <C-ScrollWheelLeft> <nop>
imap <ScrollWheelRight> <nop>
imap <S-ScrollWheelRight> <nop>
imap <C-ScrollWheelRight> <nop>

vmap <ScrollWheelUp> <nop>
vmap <S-ScrollWheelUp> <nop>
vmap <C-ScrollWheelUp> <nop>
vmap <ScrollWheelDown> <nop>
vmap <S-ScrollWheelDown> <nop>
vmap <C-ScrollWheelDown> <nop>
vmap <ScrollWheelLeft> <nop>
vmap <S-ScrollWheelLeft> <nop>
vmap <C-ScrollWheelLeft> <nop>
vmap <ScrollWheelRight> <nop>
vmap <S-ScrollWheelRight> <nop>
vmap <C-ScrollWheelRight> <nop>

"disable autocomplete with // on 'O or 'o'
"nnoremap <expr> O getline('.') =~ '^\s*//' ? 'O<esc>S' : 'O'
"nnoremap <expr> o getline('.') =~ '^\s*//' ? 'o<esc>S' : 'o'

"disable autocomplete on 'O' or 'o' especially for '//'
autocmd FileType * set formatoptions-=r
autocmd FileType * set formatoptions-=o

set completeopt=longest,menuone

"vimwiki settings
"let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.wiki'}]
"let g:vimwiki_ext2syntax = {'.wiki': 'markdown'}
let g:vimwiki_conceallevel = 2
let g:vimwiki_url_maxsave = 0

function! Formatonsave()
	let l:formatdiff = 1
	py3f /usr/share/clang/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()

"set Caps_Lock off on esc or Ctrl+[
"map <C-[> :!xdotool keyup Caps_Lock <enter>
"map <ESC> :!xdotool keyup Caps_Lock <enter>
