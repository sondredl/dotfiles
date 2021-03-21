syntax on
colorscheme zellner
set nu relativenumber
set visualbell

set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set autowrite

set nu relativenumber
set cursorline

set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4

filetype plugin indent on

nnoremap j h
nnoremap k j
nnoremap l k
nnoremap ø l

nnoremap <C-u> <C-w><C-h> 
nnoremap <C-i> <C-w><C-j>
nnoremap <C-o> <C-w><C-k> 
nnoremap <C-p> <C-w><C-l> 

"set splitbelow splitright
noremap <C-h> :vertical resize +3 <CR>
noremap <C-y> :resize +3 <CR>
"noremap <C-.> :resize -3 <CR>
noremap <C-n> <C-w>=
