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
set lazyredraw   " don't redraw everytime
set synmaxcol=128  " avoid slow rendering for long lines
syntax sync minlines=64  " faster syntax hl

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

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

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
Plug 'kchmck/vim-coffee-script'
Plug 'mustache/vim-mustache-handlebars'

Plug 'preservim/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'andrewradev/splitjoin.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'christoomey/vim-tmux-navigator'

Plug 'dhruvasagar/vim-table-mode'
Plug 'preservim/tagbar'

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
Plug 'chriskempson/base16-vim'
" Plug 'colepeters/spacemacs-theme.vim'
" Plug 'sainnhe/gruvbox-material'
" Plug 'phanviet/vim-monokai-pro'
" Plug 'flazz/vim-colorschemes'

call plug#end()

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
let mapleader = " "
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

let g:netrw_browse_split = 2
let g:netrw_banner       = 0
let g:netrw_winsize      = 25
let g:netrw_localrmdir='rm -r'

let g:mustache_abbreviations = 1

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

let test#strategy = 'vimterminal'
let test#swift#swiftpm#file_pattern = 'Tests\.swift'
" let test#swift#swiftpm#executable = "xcodebuild test -scheme to-do-list -workspace to-do-list.xcworkspace -destination 'platform=iOS Simulator,name=iPhone 11,OS=14.4' -only-testing to-do-listUITests/to_do_listUITests | xcpretty --test --color"
let test#swift#swiftpm#executable = "xcodebuild test -scheme to-do-list -workspace to-do-list.xcworkspace -destination 'platform=iOS Simulator,name=iPhone 11,OS=14.4'"
" let test#ruby#rspec#executable = "bundle exec rspec"
" let test#ruby#rspec#executable = 'spring rspec'
let test#vim#term_position = "vert botright 85"

" ================
" Markdown Preview
" ===============
nmap <C-p> <Plug>MarkdownPreviewToggle

" ================
" Todo Bujo
" ===============
let g:bujo#window_width   = 80
let g:bujo#todo_file_path = $HOME . "/.vim/bujo"
nmap <Leader>tc <Plug>BujoChecknormal
nmap <Leader>ta o<Esc><Plug>BujoAddnormal
nmap <Leader>tp :Todo<CR>
nmap <Leader>tg :Todo g<CR>

" ================
" Test Commands
" ===============
nnoremap <silent> <leader>tn :TestNearest<CR>
nnoremap <silent> <leader>tdn :TestNearest -fd<CR>
nnoremap <silent> <leader>tf :TestFile<CR>
nnoremap <silent> <leader>tdf :TestFile -fd<CR>
nnoremap <silent> <leader>tdrf :TestFile -fd --dry-run<CR>
nnoremap <silent> <leader>ts :TestSuite<CR>
nnoremap <silent> <leader>tl :TestLast<CR>
nnoremap <silent> <leader>tdl :TestLast -fd<CR>
nnoremap <silent> <leader>tv :TestVisit<CR>

" ==========
" Auto close
" ==========
" ino " ""<left>
" ino ' ''<left>
" ino ( ()<left>
" ino [ []<left>
" ino { {}<left>
ino {<CR> {<CR>}<ESC>O

" ================
" RuboCop Commands
" ===============
nnoremap <silent> <leader>r :RuboCop<CR>
nnoremap <silent> <leader>rl :RuboCop -l<CR>
nnoremap <silent> <leader>ra :RuboCop -a<CR>

" ================
" Rails Commands
" ===============
" create <%= foo %> erb tags using Ctrl-k in edit mode
imap <silent> <C-K> <%=   %><Esc>3hi

" create <%= foo %> erb tags using
imap <silent> <C-J> <%  %><Esc>2hi
:abbr pry require 'pry'; binding.pry<ESC>
:abbr prn require 'pry'; require 'pry-nav'; binding.pry<ESC>
:abbr bre require 'debug'; binding.break<ESC>

" RSpec abbr's
:abbr desc describe '' do<CR><ESC>BB
:abbr cont context '' do<CR><ESC>BB
:abbr iti it '' do<CR><ESC>BB
:abbr itii it { expect(1).to be==1 }<ESC>
:abbr let let(:) {}<ESC>02wl
:abbr befo before do<CR><ESC>
:abbr allo allow().to receive(:)<ESC>0ww
:abbr expec expect().to be<ESC>0ww

" ================
" Git Commands
" ===============
nnoremap <leader>gc :GBranches<CR>
nnoremap <leader>gap :Git add -p<CR>
nnoremap <leader>gcm :Git commit -s<CR>
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gco :Git checkout
nnoremap <leader>gps :Git push<CR>
nnoremap <leader>gpl :Git pull<CR>
nnoremap <leader>gfa :Git fetch --all<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gll :Git log<CR>
" vim-fugitive
nmap <leader>gh :diffget //2<CR>
nmap <leader>gl :diffget //3<CR>

" ================
" Search Commands
" ===============
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
" Search the cursor word as /{word}
nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>

nnoremap <silent><leader>bu :Buffers <CR>

" ================
" Window Commands
" ===============
nnoremap <silent> <leader>nt :tabnew<CR>

nnoremap vv :vsp<CR>
nnoremap ss :sp<CR>
" Moves a visual block
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <silent> <leader>50 :vertical resize 50<CR>

nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>wa :wa<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <leader>u :UndotreeShow<CR>

" ================
" Clipboard Commands
" ===============
" nnoremap <leader>cc :'<,'>w !xclip -selection clipboard<CR>
" vnoremap <leader>cc :'<,'>w !xclip -selection clipboard<CR>

"Clear current search highlight by double tapping //
nmap <silent> <leader>// :nohlsearch<CR>

" ================
" Tree Commands
" ===============
nnoremap <leader>pv :NERDTreeToggle<CR>
nnoremap <leader>pc :NERDTreeFind<CR>
 " It's necessary run to install :CocInstall coc-explorer
let g:coc_global_extensions = ['coc-explorer', 'coc-solargraph']
nmap <C-\> :CocCommand explorer --width 80<CR>
nnoremap <leader>ps :Rg<CR>
nnoremap <Leader>pff :Files<CR>
nnoremap <Leader>pft :Files spec/<CR>
nnoremap <Leader>pfm :Files app/models<CR>
nnoremap <Leader>pfM :Files app/managers<CR>
nnoremap <Leader>pfc :Files app/controllers<CR>
nnoremap <Leader>pfs :Files app/services<CR>
nnoremap <Leader>pfC :Files config<CR>
nnoremap <Leader>pfv :Files app/views<CR>
nnoremap <Leader>pfjj :Files app/assets/javascripts<CR>
nnoremap <Leader>pfjm :Files app/assets/javascripts/models<CR>
nnoremap <Leader>pfja :Files app/assets/javascripts/backbone/app_bundle<CR>
nnoremap <Leader>pfjt :Files app/assets/javascripts/templates<CR>
nnoremap <Leader>pfjv :Files app/assets/javascripts/backbone/views<CR>

" ================
" Tagbar Commands
" ===============

nmap <Leader>tt :TagbarToggle<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" To open NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

" CoC
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" Search doc on Dash app
nnoremap <silent> K :Dash!<CR>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Coc autocomplete remap
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"------

augroup CHID
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

autocmd VimEnter * source ~/.vimrc
