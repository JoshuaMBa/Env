" Enable file type based indent configuration and syntax highlighting
filetype plugin indent on
syntax on

" Personalized features
set nocompatible
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set backspace=2
set hlsearch
set number
set ruler
set nowrap
set linebreak
set incsearch
set t_Co=256
set clipboard^=unnamed,unnamedplus " Use system clipboard
set autochdir
set matchpairs+=<:>
set statusline+=%F
set whichwrap+=<,>,h,l

" Set vim tab auto complete
set wildmode=list:longest
set wildmenu

" Back to the position last time opened
if has("autocmd")
  autocmd BufRead *.txt set tw=78
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
endif

" Enable file type detection
filetype on

" C/C++ programming helpers
augroup csrc
  au!
  autocmd FileType *      set nocindent smartindent
  autocmd FileType c,cpp,h  set cindent
augroup END

" In Makefiles, don't expand tabs to spaces, since we need the actual tabs
autocmd FileType make set noexpandtab

" Map forward/backward
map fj <C-F>
map fk <C-B>

" Map move to begin line and end line
noremap H ^
noremap L $

" Map escape
inoremap jj <Esc>

" Close braces, parentheses, brackets, quotation marks automatically
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

"Plugin setup
call plug#begin()

" List of plugins
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'cesardeazevedo/Fx-ColorScheme'

call plug#end()

" Color Display
colorscheme fx
set background=dark
hi Search ctermbg=LightYellow
hi Search ctermfg=red
hi Visual ctermbg=White
