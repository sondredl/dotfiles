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

set complete+=kspell
set completeopt=menuone,longest

filetype plugin indent on
nnoremap j h
nnoremap k j
nnoremap l k
nnoremap ø l
onoremap j h
onoremap k j
onoremap l k
onoremap ø l
vnoremap j h
vnoremap k j
vnoremap l k
vnoremap ø l

noremap <C-u> <C-w><C-h> 
noremap <C-i> <C-w><C-j>
noremap <C-o> <C-w><C-k> 
noremap <C-p> <C-w><C-l> 

set splitbelow splitright
noremap <C-h> :vertical resize +3 <CR>
noremap <C-y> :resize +3 <CR>
noremap <C-n> <C-w>=

"map <F23> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

