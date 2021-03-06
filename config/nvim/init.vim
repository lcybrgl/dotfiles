call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'morhetz/gruvbox'
call plug#end()
hi Normal guibg=NONE ctermbg=NONE
syntax enable
"colorscheme PaperColor
colorscheme gruvbox
"set background=dark
"""" Misc
set encoding=UTF-8
set backspace=indent,eol,start
set clipboard=unnamedplus
"""" Leader Shortcuts
let mapleader="'"
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
noremap bl :bnext!<cr>
noremap bh :bprev!<cr>
noremap <leader>b :bdelete!<cr>
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>
nmap <leader>a :NERDTree<cr>
nmap <leader>r :NERDTreeToggle<cr>
map <leader>s :source ~/.config/nvim/init.vim<CR>
autocmd BufWritePost ~/.Xresources,~/.Xdefaults :! xrdb %
vnoremap <C-c> "+y
map <C-p> "+P
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
highlight NonText ctermbg=none
"""" Spaces & Tabs
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set modelines=1
filetype indent on
filetype plugin on
set autoindent
set list listchars=tab:»·,trail:· " show extra space characters
""""
"let base16colorspace=256  " Access colors present in 256 colorspace
"set t_Co=256
"set termguicolors
set autoread
set shortmess=I
set wildmenu
set showcmd
set relativenumber
set laststatus=2
set confirm
set visualbell
set mouse=a
set cmdheight=2
set number
set ruler
set notimeout ttimeout ttimeoutlen=200
set showmatch
set nohlsearch
set encoding=utf8
set foldcolumn=1
set noerrorbells
set novisualbell
set nobackup
set nowb
set noswapfile
set nowritebackup
set viminfo=
""" Airline config
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

au VimLeave * :!clear
