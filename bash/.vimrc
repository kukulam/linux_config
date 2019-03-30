set clipboard=unnamedplus

" https://www.vim.org/scripts/script.php?script_id=760
if !has("gui_running") 
    set t_Co=256 
endif 

set background=dark 
syntax enable
colors darcula 

"install vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'ap/vim-css-color'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.vim/fzf', 'do': './install --all' } 
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/syntastic'
Plug 'raimondi/delimitmate'
Plug 'chiel92/vim-autoformat'
call plug#end()

set wildmenu
set wildmode=longest:full,full

set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set number          " show line numbers
set showcmd         " show command in bottom bar
filetype indent on  " load filetype-specific indent files
set lazyredraw      " redraw only when we need to.
set showmatch       " highlight matching [{()}]
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
" turn off search highlight
nnoremap \ :noh<return>
let mapleader = ","

set foldenable          " enable folding
set foldlevelstart=5   " open most folds by default
set foldnestmax=10      " 10 nested fold max

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set undolevels=1000	
set smarttab	
set smartindent	
set autoindent
set shiftwidth=4	
set smartcase	
set wrap
set textwidth=100	
set spell
set backspace=indent,eol,start
set encoding=utf-8
set linebreak
set autoread
set formatoptions-=cro

set cursorline
hi clear ModeMsg
hi CursorLine   cterm=NONE ctermbg=NONE ctermfg=NONE
hi CursorLineNr ctermfg=white


