autocmd! bufwritepost ~/.vimrc source ~/.vimrc " auto run source ~/.vimrc on saving this file

syntax on
set nu relativenumber
colorscheme darkblue
set visualbell
set belloff=all
set noswapfile
"set paste
"set nopaste
set clipboard+=unnamedplus

autocmd BufWinLeave *.* mkview  "reopen on same line as closed
autocmd BufWinEnter *.* silent loadview

set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set autowrite
set autoread
set complete+=kspell
set completeopt=menuone,longest

autocmd CursorHold,CursorHoldI * checktime
" autocmd BufEnter * if getftime(expand('%')) > getftime(expand('%:p')) | echohl WarningMsg | echo "File reloaded." | echohl None | endif))))

set cursorline
set cursorcolumn
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
set scrolloff=10

set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set foldmethod=marker

filetype plugin indent on
filetype plugin on

"noremap y "y

set splitbelow splitright
noremap <C-h> :vertical resize +3 <CR>
noremap <C-y> :resize +3 <CR>
noremap <C-n> <C-w>=

" tab navigation
noremap  <C-Tab> :tabnext<CR>       " navigate to next tab
noremap  <C-S-Tab> :tabprevious<CR> " navigate to previous tab

" FILE BROWSING:
set path+=**                    "search into subwfolders & provide file-related tabcomplete
set wildmenu                    "display all maching files when tabcomplete
set wildmode=longest:full,full
set wildignorecase              "case insensitive file search
set wildignore=\*.git/\*        "ignores git-stuff in searches

let g:netrw_banner=0            "disable annoying banner
let g:netrw_browse_split=3      "open splits to the right
let g:netrw_liststyle=3         "tree view
"let g:netrw_bufsettings= 'noma nomod relativenumber nobl nowrap ro'

set omnifunc=suntaxcomplete#Complete


inoremap ( ()<Esc>:let leavechar=")"<CR>i
imap <C-j> <Esc>:exec "normal f" . leavechar<CR>a))
inoremap { { <CR> }<Esc>O


highlight Normal ctermbg=none
highlight NonText ctermbg=none


