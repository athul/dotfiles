call plug#begin('~/.localtshare/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'wakatime/vim-wakatime'
Plug 'romgrk/winteract.vim'
Plug 'klen/python-mode'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'rafalbromirski/vim-aurora'
Plug 'voldikss/vim-floaterm'
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'



call plug#end()

syntax on
set number
let g:go_def_mapping_enabled = 0

set background=dark

colorscheme aurora


if (has("termguicolors"))
  set termguicolors
endif

let g:lightline = {
      \ 'colorscheme': 'materia',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

set splitbelow
set splitright
set number relativenumber


" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" -------------------- Remaps ----------------------

" For clearing Search Highlighting
nnoremap <silent> ,<space> :nohlsearch<CR> 
" FloatTerm
nmap fn :FloatermNew zsh<CR>
nmap ft :FloatermToggle<CR>
nmap fp :FloatermNext<CR>
nmap fk :FloatermKill<CR>
nmap fo :FloatermPrev<CR>
"
"-------------- Bindings
"
map <C-B> :NERDTreeToggle <CR>
map nt :tabnew <CR>
map <leader> NT :tabclose <CR>
nmap wi :InteractiveWindow <CR>
"
"------ Terminal -----
"
tnoremap <C-Up> <C-\><C-n><C-W>k
tnoremap <C-Down> <C-\><C-n><C-W>j
tnoremap <C-Left> <C-\><C-n><C-W>h
tnoremap <C-Right> <C-\><C-n><C-W>l
tnoremap <ESC> <C-\><C-n>
