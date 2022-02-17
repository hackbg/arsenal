" set ttymouse=sgr
set noswapfile
set backspace=indent,eol,start mouse=a
set nowrap ts=2 sts=2 sw=2 et ai cc=100 foldcolumn=0
set fillchars+=vert:│
set splitbelow splitright
set cursorline
set cursorcolumn


autocmd VimResized * wincmd =



set undofile

hi ALEError cterm=italic ctermbg=16

" remember cursor position
augroup cursor
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

set nofoldenable

map ; :
map <C-s> :w<CR>
map <Leader>\ :set cursorcolumn!<Bar>set cursorline!<CR>
map <Leader><Tab> :NERDTreeToggle<CR>
map <Leader>' :TagbarToggle<CR>
map <Leader>h :nohl<cr>
map <C-_> :Commentary<CR>

colorscheme gruvbox
