"Rest of config, comments later
set hidden
set backup
set relativenumber
syntax on
set background=dark
set tabstop=4
set shiftwidth=4
set wrap

set laststatus=2
set lazyredraw
highlight VertSplit cterm=NONE
set showtabline=2
set noshowmode
let loaded_matchparen = 1
nnoremap <silent> <esc> :noh<cr><esc>
set hlsearch
set backspace=indent,eol,start

set directory=~/.vim/.swp//
set backupdir=~/.vim/.backup//
set undodir=~/.vim/.undo//

set foldenable
set foldlevelstart=10

set foldnestmax=10
set foldmethod=indent

set nocompatible              " be iMproved, required
filetype off                  " required

let g:airline_theme='minimalist'

set clipboard+=unnamedplus

"Vundle config and PluginInstall
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'lilydjwg/colorizer'
call vundle#end()

set rtp+={repository_root}/powerline/bindings/vim

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

" Use 256 colours (Use this setting only if your terminal supports 256
set t_Co=256

"disable F1 help
nnoremap <F1> <nop>
inoremap <F1> <nop>
vnoremap <F1> <nop>

" auto pair brackets
"inoremap <left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"noremap [ []<left>
"inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


"disable autocomplete on 'O' or 'o' especially for '//'
autocmd FileType * set formatoptions-=r
autocmd FileType * set formatoptions-=o

set completeopt=longest,menuone

"vimwiki settings
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.wiki'},
			\{'path': '~/documents/Diploma_Project/Research/', 'syntax': 'markdown', 'ext': '.wiki'}]
let g:vimwiki_conceallevel = 2
let g:vimwiki_url_maxsave = 0

"function! Formatonsave()
"	let l:formatdiff = 1
"	py3f /usr/share/clang/clang-format.py
"endfunction
"autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()

"configure netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
nnoremap E :Vexplore<CR>

"highlight the characters that pass 80 lenght line
match ErrorMsg '\%>80v.\+'

"Disable mouse scrolling
set mouse=
set ttymouse=

let g:airline_minimalist_bg='dark'
let g:airline#extensions#tabline#enabled = 1

let g:colorizer_maxlines = 1000
