call plug#begin('.\plugins')

Plug 'sbdchd/neoformat'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint8', 'coc-prettier', 'coc-git', 'coc-fzf-preview', 'coc-lists']
let g:mapleader = "\<Space>"
nnoremap <Leader>f <Cmd>Neoformat<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader>p "+p
nmap <Leader>P "+P

set autoindent
set cursorline
set number
set shiftwidth=4
set tabstop=4
