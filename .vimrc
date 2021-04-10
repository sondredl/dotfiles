autocmd! bufwritepost .vimrc source %
syntax on
colorscheme zellner
set nu relativenumber
set visualbell
set noswapfile

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set autowrite

set cursorline

set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4

set complete+=kspell
set completeopt=menuone,longest

filetype plugin indent on
filetype plugin on
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

" FILE BROWSING:
set path+=**        "search into subwfolders & provide file-related tabcomplete
set wildmenu                "display all maching files when tabcomplete
set wildmode=longest:full,full
set wildignorecase          "case insensitive file search
set wildignore=\*.git/\*    "ignores git-stuff in searches

let g:netrw_banner=0        "disable annoying banner
let g:netrw_browse_split=3          "open splits to the right
let g:netrw_liststyle=3     "tree view
let g:netrw_bufsettings= 'noma nomod relativenumber nobl nowrap ro'

set omnifunc=suntaxcomplete#Complete

