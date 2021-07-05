" TODO: select COC commands from https://github.com/neoclide/coc.nvim#example-vim-configuration

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
