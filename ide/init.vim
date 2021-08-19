" set ttymouse=sgr
set noswapfile
set backspace=indent,eol,start mouse=a
set nowrap ts=2 sts=2 sw=2 et ai cc=100 foldcolumn=0
set fillchars+=vert:│
set splitbelow splitright
map ; :
map <C-s> :w<CR>

autocmd VimResized * wincmd =

set cursorline
set cursorcolumn

map <Leader>\ :set cursorcolumn!<Bar>set cursorline!<CR>

set undofile

" TODO: select COC commands from https://github.com/neoclide/coc.nvim#example-vim-configuration

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

hi ALEError cterm=italic ctermbg=16

" remember cursor position
augroup cursor
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

set nofoldenable

map <Leader><Tab> :NERDTreeToggle<CR>
map <Leader>' :TagbarToggle<CR>
map <Leader>h :nohl<cr>
map <C-_> :Commentary<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

colorscheme gruvbox
