" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'jremmen/vim-ripgrep' "Need to install on machine the -> sudo apt-get install ripgrep
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'vim-utils/vim-man'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "Need to install on machine fzf
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'mbbill/undotree'
Plug 'vuciv/vim-bujo' " Simple Todo list
Plug 'ngmy/vim-rubocop'
Plug 'vim-test/vim-test'
Plug 'rizzatti/dash.vim'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'adelarsq/vim-matchit' " It's a dependency for vim-ruby-refactoring

Plug 'preservim/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'andrewradev/splitjoin.vim'
Plug 'terryma/vim-multiple-cursors'

Plug 'christoomey/vim-tmux-navigator'

Plug 'dhruvasagar/vim-table-mode'

" CoC extension Plugins
Plug 'neoclide/coc-git', {'do': 'npm install --frozen-lockfile'}
" Plug 'neoclide/coc-gist', {'do': 'npm install --frozen-lockfile'}
Plug 'neoclide/coc-solargraph', {'do': 'npm install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'npm install --frozen-lockfile'}
" Plug 'neoclide/coc-json', {'do': 'npm install --frozen-lockfile'}
" Plug 'neoclide/coc-css', {'do': 'npm install --frozen-lockfile'}
" Plug 'neoclide/coc-html', {'do': 'npm install --frozen-lockfile'}
" Plug 'neoclide/coc-tsserver', {'do': 'npm install --frozen-lockfile'}
" Plug 'neoclide/coc-python', {'do': 'npm install --frozen-lockfile'}
" Plug 'neoclide/coc-sql', {'do': 'npm install --frozen-lockfile'}

Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

call plug#end()