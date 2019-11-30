if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 install.py --clangd-completer' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'Shougo/denite.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'
Plug 'tpope/vim-fugitive'
Plug 'flazz/vim-colorschemes'
Plug 'vim-scripts/ScrollColors'
Plug 'spf13/vim-colors'
Plug 'jdsimcoe/panic.vim'
Plug 'Mcmartelle/vim-monokai-bold'
call plug#end()

set nocompatible

"Auto reload vim when the .vimrc is changed.
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Set the .md filetype to markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

filetype on
filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting

"set autowrite                       " Automatically write a file when leaving a modified buffer
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set hidden                          " Allow buffer switching without saving
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator
set pastetoggle=<F2>
set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode
set t_Co=256
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
"set cursorline                  " Highlight current line
set number

"set list
set listchars=tab:»\ ,trail:¤,eol:¬

set novisualbell " No blinking
set noerrorbells " No noise.
set vb t_vb= " disable any beeps or flashes on error
set laststatus=2 ""
set showcmd " display an incomplete command in statusline

set tabstop=4 " tab size eql 2 spaces
set softtabstop=4
set shiftwidth=4 " default shift width for indents
set expandtab " replace tabs with ${tabstop} spaces
set smarttab "

set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=1              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set background=dark

set splitbelow
set splitright
" Tabs
nnoremap <Leader>pt :tabprev<CR>
nnoremap <Leader>nt :tabnext<CR>
nnoremap <Leader>nb :bn<CR>

"My favourite leader

let mapleader = ','
let maplocalleader = '_'
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

noremap j gj
noremap k gk

nmap <silent> <leader>/ :set invhlsearch<CR>

nnoremap <Leader>pb :bp<CR>
highlight clear SignColumn      " SignCo
highlight clear LineNumber "Line number
""" NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

""" Nerd Tree git plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

color molokai
