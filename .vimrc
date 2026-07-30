" ============================================================================
" General settings
" ============================================================================
set nocompatible               " be iMproved, required
filetype off                   " required (for Vundle)

set hidden
set backup
set relativenumber
set nomodeline
syntax on
set background=dark

set tabstop=4
set shiftwidth=4
set expandtab
set wrap
set backspace=indent,eol,start

set laststatus=2
set showtabline=2
set noshowmode
set lazyredraw
set hlsearch

set clipboard+=unnamedplus

set directory=~/.vim/.swp/
set backupdir=~/.vim/.backup/
set undodir=~/.vim/.undo/

set tags=./tags;/

" Use 256 colours (only if your terminal supports it)
set t_Co=256

" Disable mouse
set mouse=

" ============================================================================
" Folding
" ============================================================================
set foldenable
set foldmethod=indent
set foldnestmax=10
set foldlevelstart=10

" ============================================================================
" Vundle / Plugins
" ============================================================================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'lilydjwg/colorizer'
Plugin 'prettier/vim-prettier'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'

call vundle#end()

set rtp+={repository_root}/powerline/bindings/vim

filetype plugin indent on      " required

" ============================================================================
" Key mappings
" ============================================================================
nnoremap <silent> <esc> :noh<cr><esc>
nnoremap <space> za
nnoremap E :Vexplore<CR>

" Disable F1 help
nnoremap <F1> <nop>
inoremap <F1> <nop>
vnoremap <F1> <nop>

" Auto pair braces
inoremap {<CR>   {<CR>}<ESC>O
inoremap {;<CR>  {<CR>};<ESC>O

" ============================================================================
" Formatting behaviour
" ============================================================================
" Disable comment-leader continuation on 'o'/'O'
autocmd FileType * set formatoptions-=r formatoptions-=o

set completeopt=longest,menuone

" Highlight characters past column 120
match ErrorMsg '\%>120v.\+'

" ============================================================================
" Airline
" ============================================================================
let g:airline_theme = 'minimalist'
let g:airline_minimalist_bg = 'dark'
let g:airline#extensions#tabline#enabled = 1
highlight VertSplit cterm=NONE

" ============================================================================
" vimwiki
" ============================================================================
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'default', 'ext': '.wiki'}]
let g:vimwiki_conceallevel = 2
let g:vimwiki_url_maxsave = 0

" ============================================================================
" netrw
" ============================================================================
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" ============================================================================
" colorizer
" ============================================================================
let g:colorizer_maxlines = 1000

" ============================================================================
" clang-format on save (C/C++/GLSL)
" ============================================================================
function! FormatBuffer()
    if &modified && !empty(findfile('.clang-format', expand('%:p:h') . ';'))
        let cursor_pos = getpos('.')
        :%!clang-format
        call setpos('.', cursor_pos)
    endif
endfunction

autocmd BufWritePre *.h,*.hpp,*.c,*.cpp,*.vert,*.frag call FormatBuffer()

" ============================================================================
" prettier
" ============================================================================
let g:prettier#autoformat = 0
let g:prettier#config#tab_width = 2

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" ============================================================================
" LSP (vim-lsp)
" ============================================================================
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

let g:lsp_format_sync_timeout = 1000

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    inoremap <buffer> <expr> <c-f> lsp#scroll(+4)
    inoremap <buffer> <expr> <c-d> lsp#scroll(-4)

    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that have the server registered
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

