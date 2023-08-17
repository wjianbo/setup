call plug#begin('~/.vim/plugged')

Plug 'vim-jp/vimdoc-ja'
Plug 'junegunn/fzf', {'dir': '~/.fzf_bin', 'do': './install --all'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lambdalisue/fern.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'sainnhe/gruvbox-material'
Plug 'rust-lang/rust.vim'
Plug 'ZSaberLv0/ZFVimIM'
Plug 'ZSaberLv0/ZFVimJob'
Plug 'vim-denops/denops.vim'
Plug 'vim-skk/skkeleton'
Plug 'Shougo/ddc.vim'

call plug#end()

"call skkeleton#config({ 'globalJisyo': '~/.skk/SKK-JISYO.L' })
call skkeleton#config({ 'globalJisyo': '~/.config/nvim/SKK-JISYO.L' })

call ddc#custom#patch_global('sources', ['skkeleton'])
call ddc#custom#patch_global('sourceOptions', {
    \   '_': {
    \     'matchers': ['matcher_head'],
    \     'sorters': ['sorter_rank']
    \   },
    \   'skkeleton': {
    \     'mark': 'skkeleton',
    \     'matchers': ['skkeleton'],
    \     'sorters': [],
    \     'minAutoCompleteLength': 2,
    \   },
    \ })
call ddc#enable()

function! s:myLocalDb()
    let db = ZFVimIM_dbInit({
                \   'name' : 'wubi',
                \ })
    call ZFVimIM_cloudRegister({
                \   'mode' : 'local',
                \   'dbId' : db['dbId'],
                \   'repoPath' : '/home/deck/git/ZFVimIM_wubi_base',
                \   'dbFile' : '/misc/wubi.txt',
                \   'dbCountFile' : '/misc/wubi_count.txt',
                \ })
endfunction
autocmd User ZFVimIM_event_OnDbInit call s:myLocalDb()
" set options
set termguicolors
set number
set updatetime=500
set expandtab
set autoindent
set cursorline
set shiftwidth=4
set tabstop=4


" map prefix
let g:mapleader = "\<Space>"
nnoremap <Leader>    <Nop>
xnoremap <Leader>    <Nop>
nnoremap <Plug>(lsp) <Nop>
xnoremap <Plug>(lsp) <Nop>
nmap     m           <Plug>(lsp)
xmap     m           <Plug>(lsp)
nnoremap <Plug>(ff)  <Nop>
xnoremap <Plug>(ff)  <Nop>
nmap     ;           <Plug>(ff)
xmap     ;           <Plug>(ff)
vmap <Leader>y "+y
vmap <Leader>d "+d
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader>p "+p
nmap <Leader>P "+P

"" fern.vim
nnoremap <silent> <Leader>e <Cmd>Fern . -drawer<CR>
nnoremap <silent> <Leader>E <Cmd>Fern . -drawer -reveal=%<CR>

"" coc.nvim
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-git', 'coc-fzf-preview', 'coc-lists']

inoremap <silent> <expr> <C-Space> coc#refresh()

nnoremap <silent> K             <Cmd>call <SID>show_documentation()<CR>
nmap     <silent> <Plug>(lsp)rn <Plug>(coc-rename)
nmap     <silent> <Plug>(lsp)a  <Plug>(coc-codeaction-cursor)
" 例
imap <C-j> <Plug>(skkeleton-enable)
cmap <C-j> <Plug>(skkeleton-enable)

function! s:coc_typescript_settings() abort
  nnoremap <silent> <buffer> <Plug>(lsp)f :<C-u>CocCommand eslint.executeAutofix<CR>:CocCommand prettier.formatFile<CR>
endfunction

augroup coc_ts
  autocmd!
  autocmd FileType typescript,typescriptreact call <SID>coc_typescript_settings()
augroup END

function! s:show_documentation() abort
  if index(['vim','help'], &filetype) >= 0
    execute 'h ' . expand('<cword>')
  elseif coc#rpc#ready()
    call CocActionAsync('doHover')
  endif
endfunction

"" fzf-preview
let $BAT_THEME                     = 'gruvbox-dark'
let $FZF_PREVIEW_PREVIEW_BAT_THEME = 'gruvbox-dark'

nnoremap <silent> <Plug>(ff)r  <Cmd>CocCommand fzf-preview.ProjectFiles<CR>
nnoremap <silent> <Plug>(ff)s  <Cmd>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> <Plug>(ff)gg <Cmd>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> <Plug>(ff)b  <Cmd>CocCommand fzf-preview.Buffers<CR>
nnoremap          <Plug>(ff)f  :<C-u>CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--exact --add-fzf-arg=--no-sort<Space>

nnoremap <silent> <Plug>(lsp)q  <Cmd>CocCommand fzf-preview.CocCurrentDiagnostics<CR>
nnoremap <silent> <Plug>(lsp)rf <Cmd>CocCommand fzf-preview.CocReferences<CR>
nnoremap <silent> <Plug>(lsp)d  <Cmd>CocCommand fzf-preview.CocDefinition<CR>
nnoremap <silent> <Plug>(lsp)t  <Cmd>CocCommand fzf-preview.CocTypeDefinition<CR>
nnoremap <silent> <Plug>(lsp)o  <Cmd>CocCommand fzf-preview.CocOutline --add-fzf-arg=--exact --add-fzf-arg=--no-sort<CR>

"" treesitter
lua <<EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "typescript",
    "tsx",
  },
  highlight = {
    enable = true,
  },
}
EOF

"" gruvbox
colorscheme gruvbox-material

" skkeleton
"imap  (skkeleton-toggle)
"cmap  (skkeleton-toggle)

call skkeleton#config({
\'eggLikeNewline':v:true
\})

call skkeleton#config({
\'globalJisyo': '~/.local/share/skk/SKK-JISYO+emoji-utf8.L'
\})

call skkeleton#config({
\'globalJisyoEncoding': 'utf-8'
\})

call skkeleton#config({
\'useSkkServer':v:true
\})

call skkeleton#config({
\'skkServerResEnc' : 'euc-jp'
\})

call skkeleton#config({
\'skkServerReqEnc' : 'euc-jp'
\})


" Customize global settings
" Use around source.
" https://github.com/Shougo/ddc-around
call ddc#custom#patch_global('sources', ['around', 'skkeleton'])

" Use matcher_head and sorter_rank.
" https://github.com/Shougo/ddc-matcher_head
" https://github.com/Shougo/ddc-sorter_rank
call ddc#custom#patch_global('sourceOptions', {
      \ 'around': {'mark': 'A'},
      \   'skkeleton': {
      \     'mark': 'skkeleton',
      \     'matchers': ['skkeleton'],
      \     'sorters': []
      \   },
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank']},
      \ })

" Change source options
call ddc#custom#patch_global('sourceOptions', {
      \ 'around': {'mark': 'A'},
      \ })
call ddc#custom#patch_global('sourceParams', {
      \ 'around': {'maxSize': 500},
      \ })

" Customize settings on a filetype
call ddc#custom#patch_filetype(['c', 'cpp'], 'sources', ['around', 'clangd'])
call ddc#custom#patch_filetype(['c', 'cpp'], 'sourceOptions', {
      \ 'clangd': {'mark': 'C'},
      \ })
call ddc#custom#patch_filetype('markdown', 'sourceParams', {
      \ 'around': {'maxSize': 100},
      \ })
