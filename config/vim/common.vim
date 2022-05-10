syntax on

set guicursor=
set cursorline
set cursorcolumn
set relativenumber
set hlsearch
set hidden
" no bells
set noerrorbells
set vb t_vb=
" ---
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir "it's necessary create this folder manually
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set showcmd

" :'<,'>w !xclip -selection clipboard
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
  set backspace=indent,eol,start  " more powerful backspacing
else
  set clipboard=unnamedplus "Linux
endif

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

set shortmess+=c

set colorcolumn=120
highlight ColorColumn ctermbg=0 guibg=lightgrey

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
