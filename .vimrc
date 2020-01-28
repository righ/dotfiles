syntax enable

colorscheme elflord

set tabstop=4
set noexpandtab
set shiftwidth=4
set ambiwidth=double
set fenc=utf-8
set number
set autoindent
set autoread
set noshowmode
set showmatch
set matchtime=1
set cursorline
"set cursorcolumn
set smartindent
set visualbell
set laststatus=2
set pumheight=10
set noruler
set clipboard+=unnamed
set clipboard+=autoselect

nnoremap Y y$
nnoremap <silent> <C-B> :bnext<CR>

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-go'
Plug 'posva/vim-vue'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'hashivim/vim-terraform'

Plug 'plasticboy/vim-markdown'
Plug 'dhruvasagar/vim-table-mode'

Plug 'airblade/vim-gitgutter'

set rtp+=~/.fzf
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-repeat'

call plug#end()

let g:terraform_align=1

let g:lsp_signature_help_enabled = 0
let g:lsp_fold_enabled = 0
let g:lsp_virtual_text_enabled = 0
let g:lsp_diagnostics_enabled = 0
let g:lsp_highlight_references_enabled = 0

" markdown
let g:vim_markdown_folding_disabled = 1
autocmd FileType markdown :silent TableModeEnable

" lightline
let g:lightline = {
\ 'colorscheme': 'jellybeans',
\ }

" needtree
" autocmd VimEnter * execute 'NERDTree'
map <C-n> :NERDTreeToggle<CR>

" ale
let g:ale_linters = {
\ 'python': ['flake8'],
\ }

let g:ale_fixers = {
\ 'python': ['black'],
\ }

if filereadable(expand('$HOME/custom.vim'))
   source $HOME/custom.vim
endif


au BufNewFile,BufRead *.go set noexpandtab tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.js set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.jsx set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.ts set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.tsx set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.vue set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.py set expandtab tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.rb set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.erb set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.htm set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.html set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.scss set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.styl set expandtab tabstop=4 shiftwidth=4

au BufNewFile,BufRead *.yml set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.yaml set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.toml set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.json set expandtab tabstop=2 shiftwidth=2

au BufNewFile,BufRead *.sh set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.bash set expandtab tabstop=2 shiftwidth=2

